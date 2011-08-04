class User < ActiveRecord::Base
  attr_accessible :name, :email
  has_many :posts

  # validates :email,   
  #           :presence => true,   
  #           :uniqueness => true,   
  #           :format => { :with => /^([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})$/i }

  def self.create_with_omniauth(auth)
  create! do |user|
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.name = auth["user_info"]["name"]
    user.email = auth["user_info"]["email"]
    end
  end
end
