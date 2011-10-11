class AddPostsCountToTag < ActiveRecord::Migration
  def self.up
  add_column :tags, :posts_count, :integer, :default => 0

  Tag.reset_column_information
  Tag.find(:all).each do |t|
    Tag.update_counters t.id, :posts_count => t.posts.length
  end
end

  def self.down
    remove_column :tags, :posts_count
  end
end
