class RemoveColumns < ActiveRecord::Migration
  def self.up
    remove_column :users, :email
    remove_column :users, :cached_slug
  end

  def self.down
  end
end
