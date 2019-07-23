class ModelsController < ApplicationController
  load_and_authorize_resource
  def index
    @models = Model.paginate :page => params[:page], :include => [:make, :category], :order => 'categories.categoryName, makes.makeName, modelName'
  end

  def show
    @model = Model.find(params[:id])
  end

  def new
    @model = Model.new
  end

  def create
    @model = Model.new(params[:model])
    if @model.save
      flash[:notice] = "Successfully created model."
      redirect_to @model
    else
      render :action => 'new'
    end
  end

  def edit
    @model = Model.find(params[:id])
  end

  def update
    @model = Model.find(params[:id])
    if @model.update_attributes(params[:model])
      flash[:notice] = "Successfully updated model."
      redirect_to @model
    else
      render :action => 'edit'
    end
  end

  def destroy
    @model = Model.find(params[:id])
    @model.destroy
    flash[:notice] = "Successfully destroyed model."
    redirect_to models_url
  end





end
