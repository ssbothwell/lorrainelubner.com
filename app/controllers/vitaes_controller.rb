class VitaesController < ApplicationController
  before_filter :require_admin, :except => [:index, :show] 

  def index
    @vitaes = Vitae.all
    @cvcats = Cvcat.all
  end
  
  def show
    @vitae = Vitae.find(params[:id])    
  end
  
  def new
    @vitae = Vitae.new
  end
  
  def create
    @vitae = Vitae.new(params[:vitae])
    if @vitae.save
      flash[:notice] = "Successfully created vitae."
      redirect_to cvcats_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    
    @vitae = Vitae.find(params[:id])
  end
  
  def update
    @vitae = Vitae.find(params[:id])
    if @vitae.update_attributes(params[:vitae])
      flash[:notice] = "Successfully updated vitae."
      redirect_to cvcats_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @vitae = Vitae.find(params[:id])
    @vitae.destroy
    flash[:notice] = "Successfully destroyed vitae."
    redirect_to cvcats_url
  end
end
