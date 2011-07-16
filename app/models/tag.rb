class Tag < ActiveRecord::Base
  attr_accessible :tag_tokens, :posts, :name
  has_friendly_id :name, :use_slug => true
  has_many :tagships
  has_many :posts, :through => :tagships
  attr_reader :tag_tokens
    
  def tag_tokens=(ids)
    self.post_ids = ids.split(",")
  end

end
