class Post < ActiveRecord::Base
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
