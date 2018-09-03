# frozen_string_literal: true

# == Schema Information
#
# Table name: users
#
#  id                              :integer          not null, primary key
#  email                           :string
#  first_name                      :string
#  last_name                       :string
#  locale                          :string           default("en")
#  country_code                    :string
#  mobile_number                   :string
#  email_permission_granted_at     :datetime
#  sms_permission_granted_at       :datetime
#  crypted_password                :string
#  password_salt                   :string
#  persistence_token               :string
#  single_access_token             :string
#  perishable_token                :string
#  password_reset_token            :string
#  password_reset_token_sent_at    :datetime
#  login_count                     :integer          default(0), not null
#  failed_login_count              :integer          default(0), not null
#  last_request_at                 :datetime
#  current_login_at                :datetime
#  last_login_at                   :datetime
#  current_login_ip                :string
#  last_login_ip                   :string
#  active                          :boolean          default(FALSE)
#  approved                        :boolean          default(FALSE)
#  confirmed                       :boolean          default(FALSE)
#  created_at                      :datetime         not null
#  updated_at                      :datetime         not null
#  account_activation_code         :string
#  account_activation_code_sent_at :datetime
#  admin_access                    :boolean          default(FALSE)
#  admin_subscription_product_id   :integer
#

require 'rails_helper'

RSpec.describe User, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
