class AddVersions < ActiveRecord::Migration
  def self.up
    Piece.create_versioned_table
  end

  def self.down
    Piece.drop_versioned_table
  end
end
