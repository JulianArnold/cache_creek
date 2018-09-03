# frozen_string_literal: true

class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string    :email, index: true
      t.string    :first_name
      t.string    :last_name
      t.string    :locale, default: 'en'
      t.string    :country_code
      t.string    :mobile_number
      t.datetime  :email_permission_granted_at
      t.datetime  :sms_permission_granted_at

      # Authlogic::ActsAsAuthentic::Password
      t.string    :crypted_password
      t.string    :password_salt # random text, diff value every user added to human-readable pw.

      # Authlogic::ActsAsAuthentic::PersistenceToken
      t.string    :persistence_token # what's placed in the cookie, recognising the logged-in user.

      # Authlogic::ActsAsAuthentic::SingleAccessToken
      t.string    :single_access_token

      # Authlogic::ActsAsAuthentic::PerishableToken
      t.string    :perishable_token

      # Password reset
      t.string    :password_reset_token
      t.datetime  :password_reset_token_sent_at

      # Authlogic::Session::MagicColumns
      t.integer   :login_count, default: 0, null: false
      t.integer   :failed_login_count, default: 0, null: false
      t.datetime  :last_request_at
      t.datetime  :current_login_at
      t.datetime  :last_login_at
      t.string    :current_login_ip
      t.string    :last_login_ip

      # Authlogic::Session::MagicStates
      t.boolean   :active, default: false
      t.boolean   :approved, default: false
      t.boolean   :confirmed, default: false
      t.timestamps null: false
    end
  end
end
