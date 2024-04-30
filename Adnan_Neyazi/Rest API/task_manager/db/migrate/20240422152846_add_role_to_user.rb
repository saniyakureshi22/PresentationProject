# frozen_string_literal: true

# This migration adds a role column to the users table.
class AddRoleToUser < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :role, :string
  end
end
