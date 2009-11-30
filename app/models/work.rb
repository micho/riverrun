class Work < ActiveRecord::Base
  attr_accessible :name, :user, :visibility_radio, :cyclic
  
  has_many :pieces, :dependent => :destroy, :order => 'position'
  belongs_to :user

  validates_presence_of :user
  
  attr_accessor :number_of_pieces
  
  def after_create
    number_of_pieces.times do |n|
      self.pieces.create :position => n
    end
  end
  
  def can_edit?(current_user)
    user == current_user
  end
  
  def can_delete?(current_user)
    user == current_user
  end
  
  def self.can_create?(current_user)
    true
  end
  
  def change_log
    self.pieces.collect do |piece|
      piece.versions
    end.flatten.sort { |a,b| a.updated_at <=> b.updated_at }
  end
  
  def unassigned_pieces
    self.pieces.select { |p| p.user.nil? }
  end
  
  def piece_assigned_to(user)
    self.pieces.find_by_user_id user.id
  end
end
