class PiecesController < ApplicationController

  before_filter :find_work, :except => :refresh
  before_filter :find_piece, :except => :refresh

  def refresh
    @piece = Piece.find(params[:id])

    respond_to do |f|
      f.js { render :layout => false }
    end
  end

  def edit
    permission_denied unless @piece.can_edit?(current_user)
    
    assigned_piece = @work.pieces.find_by_user_id current_user.id
    if assigned_piece and assigned_piece != @piece
      flash[:error] = "You can't collaborate with more than one piece at a time in a project. Sorry!"
      redirect_to work_path(@work)
      return
    end

    if @piece.user.nil? and @piece.can_claim?(current_user)
      @piece.user = current_user
      @piece.save!
    end
  end
  
  def update
    permission_denied unless @piece.can_edit?(current_user)

    if @piece.work.completed_at
      flash[:error] = t('pieces.edit.complete')
      redirect_to edit_work_piece_path
    elsif @piece.update_attributes(params[:piece])
      flash[:notice] = t('pieces.edit.updated')
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
