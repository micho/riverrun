class PiecesController < ApplicationController

  before_filter :find_work, :find_piece

  def edit
    permission_denied unless @piece.can_edit?(current_user)
    if @piece.user.nil? and @piece.can_claim?(current_user)
      @piece.user = current_user
      @piece.save!
    end
  end
  
  def update
    permission_denied unless @piece.can_edit?(current_user)
    if @piece.update_attributes(params[:piece])
      flash[:notice] = "Successfully updated piece."
      redirect_to edit_work_piece_path
    else
      render :action => 'edit'
    end
  end

  private
  
  def find_work
    not_found unless @work = Work.find(params[:work_id])
  end
  
  def find_piece
    not_found unless @piece = @work.pieces.find(params[:id])
  end
end
