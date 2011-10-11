class AddPostsCountToTag < ActiveRecord::Migration
  def self.up
  add_column :tags, :posts_count, :integer, :default => 0

  Tag.reset_column_information
  Tag.find_each do |t|
    Tag.reset_counters t.id, :posts
  end
end

  def self.down
    remove_column :tags, :posts_count
  end
end
