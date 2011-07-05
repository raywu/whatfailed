class Tag < ActiveRecord::Base
  attr_accessible :tag_tokens, :posts, :name
  has_many :tagships
  has_many :posts, :through => :tagships
  attr_reader :tag_tokens
end
