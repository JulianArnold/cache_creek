class CreateAdminSubscriptionPlans < ActiveRecord::Migration
  def change
    create_table :admin_subscription_plans do |t|
      t.string :name
      t.integer :price_cent, default: 0
      t.integer :billing_frequency_months
      t.string :currency
      t.string :stripe_uuid, index: true
      t.integer :trial_period_days
      t.boolean :active
      t.integer :subscription_product_id, index: true

      t.timestamps null: false
    end
  end
end
