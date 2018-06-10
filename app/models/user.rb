# == Schema Information
#
# Table name: users
#
#  id                           :integer          not null, primary key
#  email                        :string
#  first_name                   :string
#  last_name                    :string
#  locale                       :string           default("en")
#  country_code                 :string
#  mobile_number                :string
#  email_permission_granted_at  :datetime
#  sms_permission_granted_at    :datetime
#  crypted_password             :string
#  password_salt                :string
#  persistence_token            :string
#  single_access_token          :string
#  perishable_token             :string
#  password_reset_token         :string
#  password_reset_token_sent_at :datetime
#  login_count                  :integer          default(0), not null
#  failed_login_count           :integer          default(0), not null
#  last_request_at              :datetime
#  current_login_at             :datetime
#  last_login_at                :datetime
#  current_login_ip             :string
#  last_login_ip                :string
#  active                       :boolean          default(FALSE)
#  approved                     :boolean          default(FALSE)
#  confirmed                    :boolean          default(FALSE)
#  created_at                   :datetime         not null
#  updated_at                   :datetime         not null
#

class User < ActiveRecord::Base
  acts_as_authentic do |c|
    c.login_field = :email
    c.validates_uniqueness_of_email_field_options = { case_sensitive: false }
    c.validates_format_of_email_field_options = { with: Authlogic::Regex.email_nonascii }
    c.crypto_provider = Authlogic::CryptoProviders::SCrypt
  end

  # relationships
  has_many :organisations
  has_many :people
  has_many :opportunities
  has_many :curriculum_vitaes

  # validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :locale, presence: true
  validates :mobile_number, presence: true

  # callbacks
  before_destroy :check_deletable

  # instance methods
  def full_name
    first_name.to_s.titleize + ' ' + last_name.to_s.gsub("'", "' ").titleize.gsub("' ", "'")
  end

  private

  def check_deletable
    false # we do not allow users to be deleted
  end
end
