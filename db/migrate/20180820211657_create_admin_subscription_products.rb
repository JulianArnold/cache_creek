class CreateAdminSubscriptionProducts < ActiveRecord::Migration
  def change
    create_table :admin_subscription_products do |t|
      t.integer :lock_version, default: 0
      t.string :name
      t.text :description
      t.boolean :curriculum_vitae_limited, default: true
      t.integer :curriculum_vitae_limit, default: 0
      t.boolean :opportunity_limited, default: true
      t.integer :opportunity_limit, default: 0
      t.boolean :organisation_limited, default: true
      t.integer :organisation_limit, default: 0
      t.boolean :person_limited, default: true
      t.integer :person_limit, default: 0

      t.timestamps null: false
    end
  end
end
