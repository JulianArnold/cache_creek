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

require 'rails_helper'

RSpec.describe Admin::SubscriptionPlan, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
