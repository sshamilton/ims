class KitsController < ApplicationController
 load_and_authorize_resource
  def index
    @kits = Kit.all
  end
  
  def show
    @kit = Kit.find(params[:id])
  end
  
  def new
    @kit = Kit.new
  end
  
  def create
    @kit = Kit.new(params[:kit])
    if @kit.save
      flash[:notice] = "Successfully created kit."
      redirect_to @kit
    else
      render :action => 'new'
    end
  end
  
  def edit
    @kit = Kit.find(params[:id])
  end
  
  def update
    @kit = Kit.find(params[:id])
    if @kit.update_attributes(params[:kit])
      flash[:notice] = "Successfully updated kit."
      redirect_to @kit
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @kit = Kit.find(params[:id])
    @kit.destroy
    flash[:notice] = "Successfully destroyed kit."
    redirect_to kits_url
  end
end
