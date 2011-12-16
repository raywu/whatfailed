class FixColumnName < ActiveRecord::Migration
  def self.up
    rename_column :identities, :user, :name
  end

  def self.down
  end
end
