# frozen_string_literal: true

# == Schema Information
#
# Table name: opportunities
#
#  id              :integer          not null, primary key
#  organisation_id :integer
#  person_id       :integer
#  job_title       :string
#  job_description :text
#  category        :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#  user_id         :integer
#

class Opportunity < ActiveRecord::Base
  belongs_to :organisation
  belongs_to :person
  belongs_to :user

  validates :organisation_id, presence: true
  validates :person_id, presence: true
  validates :job_title, presence: true
  validates :job_description, presence: true
  validate :match_organisation_to_person

  # scopes
  scope :all_in_order, -> { order(updated_at: :desc) }

  # callbacks
  before_create :check_subscription_product_limit

  private

  def check_subscription_product_limit
    product = User.current&.admin_subscription_product
    if product.nil?
      errors.add(:base, "You don't have a subscription")
      Rails.logger.warn "User #{User.current_id} tried to create an Opportunity but had no subscription_product."
      return false
    end
    return true unless product.opportunity_limited
    if product.opportunity_limit <= Opportunity.where(user_id: User.current_id).count
      # only runs when the person is over their limit
      errors.add(:base, 'You have exceeded the limit for your subscription.  Your Opportunity was not saved.')
      return false
    end
    true
  end

  def match_organisation_to_person
    errors.add(:organisation_id, 'person unmatched with organisation') unless
         organisation_id == person.organisation_id
  end
end
