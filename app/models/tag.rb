class Tag < ActiveRecord::Base
  has_many :tagships
  has_many :tags, :through => :tagships
end
