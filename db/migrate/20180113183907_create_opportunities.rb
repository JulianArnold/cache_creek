class CreateOpportunities < ActiveRecord::Migration
  def change
    create_table :opportunities do |t|
      t.integer :organisation_id
      t.integer :person_id
      t.string :job_title
      t.text :job_description
      t.string :category

      t.timestamps null: false
    end
  end
end
