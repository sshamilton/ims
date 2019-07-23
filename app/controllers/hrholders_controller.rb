class HrholdersController < ApplicationController
  load_and_authorize_resource
  # GET /hrholders
  # GET /hrholders.xml
  def index
    @hrholders = Hrholder.all :order => "name"

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @hrholders }
      format.csv { render :csv => @hrholders }
    end
  end

  # GET /hrholders/1
  # GET /hrholders/1.xml
  def show
     
    @hrholder = Hrholder.find(params[:id])
    #@items = @hrholder.items.joins(:location, :model => :category).order('locations.roomNum, categories.categoryName, models.modelName').group_by { |t| t.model.category.categoryName }
    #@categories = @items.group_by { |t| t.model.category.categoryName }

     @items = @hrholder.items_by_location

    respond_to do |format|
      format.html { render :layout => "hrholderblank" }# show.html.erb
      format.xml  { render :xml => @hrholder }
      format.csv  { render :layout => false}
    end
  end

  def select
    @hrholder = Hrholder.find(params[:id])
    @items = @hrholder.items_by_location
    respond_to do |format|
      format.html
 
  def picture
    @hrholder = Hrholder.find(params[:id]) 
    @items = @hrholder.items_by_location

    respond_to do |format|
      format.html { render :layout => "hrholderblank" }# show.html.erb
      
    end
  end
  

  # GET /hrholders/new
  # GET /hrholders/new.xml
  def new
    @hrholder = Hrholder.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @hrholder }
    end
  end

  # GET /hrholders/1/edit
  def edit
    @hrholder = Hrholder.find(params[:id])
  end

  # POST /hrholders
  # POST /hrholders.xml
  def create
    @hrholder = Hrholder.new(params[:hrholder])

    respond_to do |format|
      if @hrholder.save
        format.html { redirect_to(@hrholder, :notice => 'Hrholder was successfully created.') }
        format.xml  { render :xml => @hrholder, :status => :created, :location => @hrholder }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @hrholder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /hrholders/1
  # PUT /hrholders/1.xml
  def update
    @hrholder = Hrholder.find(params[:id])

    respond_to do |format|
      if @hrholder.update_attributes(params[:hrholder])
        format.html { redirect_to(@hrholder, :notice => 'Hrholder was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @hrholder.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /hrholders/1
  # DELETE /hrholders/1.xml
  def destroy
    @hrholder = Hrholder.find(params[:id])
    @hrholder.destroy

    respond_to do |format|
      format.html { redirect_to(hrholders_url) }
      format.xml  { head :ok }
    end
  end
end
