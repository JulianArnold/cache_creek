# frozen_string_literal: true

class AddAccountActivationFieldsToUser < ActiveRecord::Migration
  def change
    add_column :users, :account_activation_code, :string
    add_index :users, :account_activation_code
    add_column :users, :account_activation_code_sent_at, :datetime
  end
end
