class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.string :title
      t.string :url
      t.text :content

      t.timestamps :created_at
    end
  end

  def self.down
    drop_table :posts
  end
end
