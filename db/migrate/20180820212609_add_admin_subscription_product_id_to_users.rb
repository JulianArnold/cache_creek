# frozen_string_literal: true

class AddAdminSubscriptionProductIdToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin_subscription_product_id, :integer
    add_index :users, :admin_subscription_product_id
  end
end
