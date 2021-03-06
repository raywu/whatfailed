class Post < ActiveRecord::Base
  attr_accessible :title, :url, :content, :tag_tokens, :tags, :created_at
  has_friendly_id :title, :use_slug => true
  has_many :tagships
  has_many :tags, :through => :tagships
  attr_reader :tag_tokens
  belongs_to :user
  cattr_reader :per_page
  @@per_page = 10
  
  validates :title, :presence => true
  validates :url, :allow_blank => true,
                  :format => { :with => /^(http|https)/, :message => "needs to start with http:// or https://"}
 
  acts_as_voteable
  
 def tag_tokens=(ids)
   self.tag_ids = ids.split(",")
 end

 def belongs_to?(user)
   self.user_id == user.id
 end
end
