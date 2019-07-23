class MakeCategoriesController < ApplicationController
  load_and_authorize_resource
  def index
    @make_categories = MakeCategory.all :order => "makeName"
  end
  
  def show
    @make_category = MakeCategory.find(params[:id])
  end
  
  def new
    @make_category = MakeCategory.new
  end
  
  def create
    @make_category = MakeCategory.new(params[:make_category])
    if @make_category.save
      flash[:notice] = "Successfully created make has category."
      redirect_to @make_category
    else
      render :action => 'new'
    end
  end
  
  def edit
    @make_category = MakeCategory.find(params[:id])
  end
  
  def update
    @make_category = MakeCategory.find(params[:id])
    if @make_category.update_attributes(params[:make_category])
      flash[:notice] = "Successfully updated make has category."
      redirect_to @make_category
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @make_category = MakeCategory.find(params[:id])
    @make_category.destroy
    flash[:notice] = "Successfully destroyed make has category."
    redirect_to make_categories_url
  end
end
