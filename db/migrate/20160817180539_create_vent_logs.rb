class CreateVentLogs < ActiveRecord::Migration
  def change
    create_table :vent_logs do |t|
      t.string :organization
      t.string :contact
      t.string :notes
      t.integer :phone
      t.string :email
      t.string :source
      t.string :cv_sent
      t.string :interest
      t.string :cv_version

      t.timestamps null: false
    end
  end
end
