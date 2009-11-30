class WorksController < ApplicationController
  def index
    @works = Work.all
  end
  
  def show
    @work = Work.find(params[:id])
  end
  
  def changelog
    @work = Work.find(params[:id])    
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
