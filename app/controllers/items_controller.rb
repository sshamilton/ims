    #layout 'public'
class ItemsController < ApplicationController
    load_and_authorize_resource

  def index
    @search = Item.search(params[:search])
		@items = @search.all.paginate :page => params[:page], :order => 'rfid'
		respond_to do |format|
			format.html
			format.csv  { render :layout => false}
		end
  end
  
  def show
    @item = Item.find(params[:id])
  end
  def search
    @item = Item.find(params[:id])
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(params[:item])
    #@item.model_id = params[:item][:model]
    if @item.save
      flash[:notice] = "Successfully created item."
      redirect_to @item
    else
      format.html { render :action => "new" }
    end
  end
  
  def edit
    @item = Item.find(params[:id])
    #@item.model_id = 
    #@item.model_id = params[:item][:model]
  end
  
  def update
    @item = Item.find(params[:id])
    
    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to(@item, :notice => 'Item was successful
ly updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @item.errors, :status => :unprocessable
_entity }
      end
    end
  end
  
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    flash[:notice] = "Successfully destroyed item."
    redirect_to changes_url
  end

  def report
    @items = items.count(:all)
  end






  

end
