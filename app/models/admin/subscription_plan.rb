# frozen_string_literal: true

# == Schema Information
#
# Table name: admin_subscription_plans
#
#  id                       :integer          not null, primary key
#  name                     :string
#  price_cent               :integer          default(0)
#  billing_frequency_months :integer
#  currency                 :string
#  stripe_uuid              :string
#  trial_period_days        :integer
#  active                   :boolean
#  subscription_product_id  :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

module Admin
  # holds our subscription plans (which are synced with Stripe)
  class SubscriptionPlan < ActiveRecord::Base
    # validations
    validates :name, presence: true, uniqueness: true
    validates :price_cent, presence: true, numericality: { greater_than_or_equal_to: 0 }
    validates :billing_frequency_months, presence: true,
                                         numericality: { greater_than_or_equal_to: 1, less_than_or_equal_to: 12 }
    validates :currency, presence: true
    validates :trial_period_days, presence: true,
                                  numericality: { greater_than_or_equal_to: 0, less_than_or_equal_to: 30 }
    validate :prevent_changes_not_supported_on_stripe, on: :update

    # callbacks
    before_create :create_on_stripe
    before_update :update_on_stripe
    before_destroy :ok_to_delete # if true proceed to the next callback OR stop (return false: callback chain halted)
    before_destroy :delete_from_stripe

    # scopes
    scope :all_in_order, -> { order(:name) }
    scope :all_active, -> { where(active: true) }
    scope :all_inactive, -> { where.not(active: true) }

    def create_on_stripe
      self.stripe_uuid = Stripe::Plan.create(
        amount: price_cent,
        interval: 'month',
        interval_count: billing_frequency_months,
        product: { name: name },
        currency: currency,
        trial_period_days: trial_period_days,
        active: active
      )['id']
    rescue Stripe::InvalidRequestError => err
      errors.add(:base, "failed to be created on Stripe: #{err.message}")
      false
    end

    def update_on_stripe
      p = Stripe::Plan.retrieve(self.stripe_uuid)
      p.active = active
      p.nickname = name
      p.trial_period_days = trial_period_days
      p.save
    rescue Stripe::InvalidRequestError => err
      errors.add(:base, "failed to be updated on Stripe: #{err.message}")
      false
    end

    def prevent_changes_not_supported_on_stripe
      %i[price_cent billing_frequency_months currency].each do |field|
        errors.add(field, 'Cannot be changed once sent to Stripe') if attribute_changed?(field)
      end
    end

    def read_from_stripe
      Stripe::Plan.retrieve(self.stripe_uuid)
    rescue Stripe::InvalidRequestError => err
      Rails.logger.error "Could not find subscription plan #{id} on Stripe: #{err}"
      nil
    end

    def ok_to_delete
      # false # not OK to delete
      true # OK to delete
    end

    def delete_from_stripe
      stripe_plan = read_from_stripe
      return true if stripe_plan.nil?
      stripe_plan.delete
      Rails.logger.info "Subscription plan #{id} deleted on Stripe: #{stripe_plan.to_h.to_json}"
      return true
    rescue Stripe::InvalidRequestError => err
      Rails.logger.error "Could not delete subscription plan #{id} on Stripe: #{err}"
      return false
    rescue Stripe::APIConnectionError => err
      Rails.logger.error "Could not get a response from Stripe.com when trying to delete subscription plan #{id} - error: #{err}"
      return false
    end
  end
end
