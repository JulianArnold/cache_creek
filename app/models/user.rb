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
#

class User < ActiveRecord::Base
  attr_accessor :current_password

  acts_as_authentic do |c|
    c.login_field = :email
    c.validates_uniqueness_of_email_field_options = { case_sensitive: false }
    c.validates_format_of_email_field_options = { with: Authlogic::Regex.email_nonascii }
    c.crypto_provider = Authlogic::CryptoProviders::SCrypt
    c.logged_in_timeout = 20.minutes
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
  before_create :generate_activation_token
  before_destroy :check_deletable

  # instance methods

  # sample of what to expect in params
  # params = { current_password: 'abc123', password: 'def456', password_confirmation: 'def456' }
  def change_password(params)
    return false if params[:current_password].blank?
    return false if params[:password].blank?
    return false if params[:password_confirmation].blank?
    unless self.valid_password?(params[:current_password])
      errors.add(:current_password, 'is invalid')
      return false
    end
    self.password = params[:password]
    self.password_confirmation = params[:password_confirmation]
    self.save
  end

  def full_name
    first_name.to_s.titleize + ' ' + last_name.to_s.gsub("'", "' ").titleize.gsub("' ", "'")
  end

  # class methods

  def self.activation_valid?(the_token)
    user = User.find_by(account_activation_code: the_token)
    return false unless user # guard clause
    Rails.logger.debug "user ID = #{user.id} found with token #{the_token}."
    return false unless user.account_activation_code_sent_at > (Time.now - 1.week)
    Rails.logger.debug "user ID = #{user.id}'s token is current."
    user.update_attributes(
        account_activation_code: nil, account_activation_code_sent_at: nil,
        active: true, approved: true, confirmed: true
    )
  end

  private

  def check_deletable
    false # we do not allow users to be deleted
  end

  def generate_activation_token
    self.account_activation_code = SecureRandom.uuid
    self.account_activation_code_sent_at = Time.now
  end
end
