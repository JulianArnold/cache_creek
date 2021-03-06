# frozen_string_literal: true

class AddAdminAccessToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin_access, :boolean, default: false
  end
end
