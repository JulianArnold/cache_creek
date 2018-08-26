# == Schema Information
#
# Table name: admin_subscription_products
#
#  id                        :integer          not null, primary key
#  lock_version              :integer          default(0)
#  name                      :string
#  description               :text
#  curriculum_vitae_limited :boolean          default(TRUE)
#  curriculum_vitae_limit    :integer          default(0)
#  opportunity_limited      :boolean          default(TRUE)
#  opportunity_limit         :integer          default(0)
#  organisation_limited     :boolean          default(TRUE)
#  organisation_limit        :integer          default(0)
#  person_limited           :boolean          default(TRUE)
#  person_limit              :integer          default(0)
#  created_at                :datetime         not null
#  updated_at                :datetime         not null
#

class Admin::SubscriptionProduct < ActiveRecord::Base
  # relationships
  has_many :users

  # validations
  validates :name, presence: true, uniqueness: true,
                   length: { maximum: 255 }
  validates :description, allow_blank: true, length: { maximum: 65_535 }
  validates :curriculum_vitae_limit, presence: true, numericality: { greater_than: 0 }, if: 'curriculum_vitae_limited == true'
  validates :opportunity_limit, presence: true, numericality: { greater_than: 0 }, if: 'opportunity_limited'
  validates :organisation_limit, presence: true, numericality: { greater_than: 0 }, if: 'organisation_limited'
  validates :person_limit, presence: true, numericality: { greater_than: 0 }, if: 'person_limited'

  # scopes
  scope :all_in_order, -> { order(:name) }
end
