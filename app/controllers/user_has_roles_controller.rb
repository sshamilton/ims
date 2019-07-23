class UserHasRolesController < ApplicationController
  load_and_authorize_resource
  def index
    @user_has_roles = UserHasRole.all
  end
  
  def show
    @user_has_role = UserHasRole.find(params[:id])
  end
  
  def new
    @user_has_role = UserHasRole.new
  end
  
  def create
    @user_has_role = UserHasRole.new(params[:user_has_role])
    if @user_has_role.save
      flash[:notice] = "Successfully created user has role."
      redirect_to @user_has_role
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user_has_role = UserHasRole.find(params[:id])
  end
  
  def update
    @user_has_role = UserHasRole.find(params[:id])
    if @user_has_role.update_attributes(params[:user_has_role])
      flash[:notice] = "Successfully updated user has role."
      redirect_to @user_has_role
    else
      render :action => 'edit'
    end
  end
  
  def destroy
    @user_has_role = UserHasRole.find(params[:id])
    @user_has_role.destroy
    flash[:notice] = "Successfully destroyed user has role."
    redirect_to user_has_roles_url
  end
end
