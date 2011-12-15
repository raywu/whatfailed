class User < ActiveRecord::Base
  attr_accessible :name
  has_many :posts
  
  acts_as_voter

  def self.create_with_omniauth(auth)
  create! do |user|
    user.provider = auth["provider"]
    user.uid = auth["uid"]
    user.name = auth["info"]["name"]
    end
  end
end
