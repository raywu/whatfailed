class Post < ActiveRecord::Base
  attr_accessible :title, :url, :content, :tag_tokens, :tags
  has_many :tagships
  has_many :tags, :through => :tagships
  attr_reader :tag_tokens
  
  def tag_tokens=(ids)
    self.tag_ids = ids.split(",")
  end
  
  validates :title, :presence => true
#  The following is meant to define no url as valid
  # validates_presence_of :url, :if => :exist?
  # 
  # def exist?
  #   if url.empty?
  #     url = @post
  #   else
  #     url
  #   end
  # end
end
