class Work < ActiveRecord::Base
  attr_accessible :name
  
  has_many :pieces
end
