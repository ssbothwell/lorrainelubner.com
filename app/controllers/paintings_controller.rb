class PaintingsController < ApplicationController
  before_filter :require_admin, :except => [:index, :show] 

  def index
    @paintings = Painting.paginate :per_page => 16, :page => params[:page], :order => 'created_at DESC'
  end
  
  def show
    @painting = Painting.find(params[:id])
  end
  
  def new
    @painting = Painting.new
  end
  
  def create
    @painting = Painting.new(params[:painting])
    if @painting.save
      flash[:notice] = "Successfully created painting."
      redirect_to paintings_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @painting = Painting.find(params[:id])
  end
  
  def update
    @painting = Painting.find(params[:id])
    if @painting.update_attributes(params[:painting])
      flash[:notice] = "Successfully updated painting."
      redirect_to paintings_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @painting = Painting.find(params[:id])
    @painting.destroy
    flash[:notice] = "Successfully destroyed painting."
    redirect_to paintings_url
  end
end
