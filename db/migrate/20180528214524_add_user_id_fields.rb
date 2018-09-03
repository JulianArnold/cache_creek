# frozen_string_literal: true

class AddUserIdFields < ActiveRecord::Migration
  def change
    add_column :organisations, :user_id, :integer
    add_column :people, :user_id, :integer
    add_column :opportunities, :user_id, :integer
    add_column :curriculum_vitaes, :user_id, :integer

    add_index :organisations, :user_id
    add_index :people, :user_id
    add_index :opportunities, :user_id
    add_index :curriculum_vitaes, :user_id
  end
end
