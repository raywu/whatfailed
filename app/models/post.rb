class Post < ActiveRecord::Base
  attr_accessible :title, :url, :content, :tag_tokens, :tags
  has_many :tagships
  has_many :tags, :through => :tagships
  attr_reader :tag_tokens
  cattr_reader :per_page
  @@per_page = 4
  
  def tag_tokens=(ids)
    self.tag_ids = ids.split(",")
  end
  
  validates :title, :presence => true

end
