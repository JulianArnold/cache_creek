# frozen_string_literal: true

# == Schema Information
#
# Table name: people
#
#  id                   :integer          not null, primary key
#  first_name           :string
#  last_name            :string
#  email                :string
#  phone                :string
#  organisation_id      :integer
#  linkedin_profile_url :string
#  next_contact_on      :date
#  source_of_contact    :string
#  cv_sent_on           :date
#  cv_version           :string
#  status               :string
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  user_id              :integer
#

class Person < ActiveRecord::Base
  STATUSES = ['New', 'Not Interested', 'Active', 'Dormant', 'Closed'].freeze
  LABELS_FOR_STATUSES = { new: 'primary', not_interested: 'danger', active: 'success', dormant: 'warning', closed: 'default' }.freeze

  belongs_to :organisation
  has_many :opportunities
  belongs_to :user

  validates :first_name, presence: true
  validates :email, presence: true, uniqueness: true
  validates :organisation_id, presence: true
  validates :status, presence: true, inclusion: { in: STATUSES }

  def full_name
    first_name + ' ' + last_name
  end

  # scopes
  scope :all_in_order, -> { order(updated_at: :desc) }
  scope :for_current_user, -> { where(user_id: User.current_id) }

  # callbacks
  before_create :check_subscription_product_limit

  # class methods
  def self.search_for(search_term)
    where('first_name LIKE :term OR last_name LIKE :term OR email LIKE :term OR phone LIKE :term', term: '%' + search_term + '%').for_current_user.map do |result|
      { label: result.first_name, record: result }
    end
  end

  private

  def check_subscription_product_limit
    product = User.current&.admin_subscription_product
    if product.nil?
      errors.add(:base, "You don't have a subscription")
      Rails.logger.warn "User #{User.current_id} tried to create a Person but had no subscription_product."
      return false
    end
    return true unless product.person_limited
    if product.person_limit <= Person.where(user_id: User.current_id).count
      # only runs when the person is over their limit
      errors.add(:base, 'You have exceeded the limit for your subscription.  Your Person was not saved.')
      return false
    end
    true
  end
end
