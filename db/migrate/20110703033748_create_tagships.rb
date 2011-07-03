class CreateTagships < ActiveRecord::Migration
  def self.up
    create_table :tagships do |t|
      t.integer :post_id
      t.integer :tag_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tagships
  end
end
