class Piece < ActiveRecord::Base
  attr_accessible :text
  
  belongs_to :user
  belongs_to :work
  
  def can_edit?(current_user)
    [current_user, work.user, nil].include? current_user
  end
  
  def can_claim?(current_user)
    current_user != work.user
  end
end
