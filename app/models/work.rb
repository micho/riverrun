class Work < ActiveRecord::Base
  attr_accessible :name
  attr_accessible :user
  
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
  
  def cyclic
    true
  end

  def visibility_radio
    2
  end
end
