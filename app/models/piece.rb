class Piece < ActiveRecord::Base
  attr_accessible :text
  
  belongs_to :user
  belongs_to :work
  
  acts_as_list :scope => :work
  
  def can_edit?(current_user)
    [current_user, work.user, nil].include? current_user
  end
  
  def can_claim?(current_user)
    current_user != work.user
  end
  
  def previous(n = 1)
    self.next(-n)
  end
  
  def next(n = 1)
    if work.cyclic
      work.pieces[(position-1 + n) % work.pieces.size]
    else
      if (position-1 + n) >= 0
        work.pieces[(position-1 + n)]
      end
    end
  end
end
