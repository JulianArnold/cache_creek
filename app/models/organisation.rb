# == Schema Information
#
# Table name: organisations
#
#  id             :integer          not null, primary key
#  name           :string
#  postal_address :text
#  phone          :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  user_id        :integer
#

class Organisation < ActiveRecord::Base
  validates :name, presence: true, uniqueness: true
  validates :phone, format: /\A[\d(\+][\d\()\-\ ]{6,20}\z/,
            allow_blank: true
  has_many :people
  has_many :opportunities
  belongs_to :user

  # callbacks
  before_create :check_subscription_product_limit

  private

  def check_subscription_product_limit
    product = User.current&.admin_subscription_product
    if product.nil?
      errors.add(:base, "You don't have a subscription")
      Rails.logger.warn "User #{User.current_id} tried to create an Organisation but had no subscription_product."
      return false
    end
    return true unless product.organisation_limited
    if product.organisation_limit <= Organisation.where(user_id: User.current_id).count
      # only runs when the person is over their limit
      errors.add(:base, 'You have exceeded the limit for your subscription.  Your Organisation was not saved.')
      return false
    end
    true
  end
end
