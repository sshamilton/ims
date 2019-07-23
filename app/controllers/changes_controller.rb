class ChangesController < ApplicationController
  def index
		@items = Item.paginate :page => params[:page], :order => 'updated_at desc, created_at desc, rfid'
  end

end
