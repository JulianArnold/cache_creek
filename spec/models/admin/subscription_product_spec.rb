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

require 'rails_helper'

RSpec.describe Admin::SubscriptionProduct, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
