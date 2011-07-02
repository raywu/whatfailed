class Post < ActiveRecord::Base
  validates :title, :presence => true
  # validates_presence_of :url      
  
  # validates :url,   :presence => true
end
