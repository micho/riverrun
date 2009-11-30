class WorksController < ApplicationController
  def index
    @works = Work.all
  end
  
  def show
    @work = Work.find(params[:id])
    if not @work.can_edit?(current_user)
      piece = @work.piece_assigned_to current_user
      if piece
        redirect_to edit_work_piece_path(@work,piece)
      else
        @unassigned_pieces = @work.unassigned_pieces
      end
    end
  end
  
  def changelog
    @work = Work.find(params[:id])
    @change_log = @work.change_log    
  end
  
  def new
    permission_denied unless Work.can_create?(current_user)
    @work = Work.new
  end
  
  def create
    permission_denied unless Work.can_create?(current_user)
    @work = Work.new(params[:work])
    @work.user = current_user
    @work.number_of_pieces = params[:work][:number_of_pieces].to_i
    if @work.save
      flash[:notice] = "Successfully created work."
      redirect_to @work
    else
      render :action => 'new'
    end
  end
  
  def edit
    @work = Work.find(params[:id])
    permission_denied unless @work.can_edit?(current_user)
  end
  
  def update
    @work = Work.find(params[:id])
    permission_denied unless @work.can_edit?(current_user)
    if @work.update_attributes(params[:work])
      flash[:notice] = "Successfully updated work."
      redirect_to @work
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @work = Work.find(params[:id])
    permission_denied unless @work.can_delete?(current_user)
    @work.destroy
    flash[:notice] = "Successfully destroyed work."
    redirect_to works_url
  end
end
