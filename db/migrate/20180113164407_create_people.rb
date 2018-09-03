# frozen_string_literal: true

class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.integer :organisation_id
      t.string :linkedin_profile_url
      t.date :next_contact_on
      t.string :source_of_contact
      t.date :cv_sent_on
      t.string :cv_version
      t.string :status

      t.timestamps null: false
    end
  end
end
