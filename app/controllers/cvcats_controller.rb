class CvcatsController < ApplicationController
  before_filter :require_user, :except => [:index, :show] 
  def index
    @cvcats = Cvcat.all
  end
  
  def show
    @cvcat = Cvcat.find(params[:id])
  end
  
  def new
    @cvcat = Cvcat.new
  end
  
  def create
    @cvcat = Cvcat.new(params[:cvcat])
    if @cvcat.save
      flash[:notice] = "Successfully created cvcat."
      redirect_to cvcats_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @cvcat = Cvcat.find(params[:id])
  end
  
  def update
    @cvcat = Cvcat.find(params[:id])
    if @cvcat.update_attributes(params[:cvcat])
      flash[:notice] = "Successfully updated cvcat."
      redirect_to cvcats_url
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @cvcat = Cvcat.find(params[:id])
    @cvcat.destroy
    flash[:notice] = "Successfully destroyed cvcat."
    redirect_to cvcats_url
  end
end
