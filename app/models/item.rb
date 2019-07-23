class Item < ActiveRecord::Base

  attr_accessible :rfid, :dateAcquired,  :serialNum, :barcode, :originalValue, :location_id, :model_id, :photo, :photo_file_name, :photo_content_type, :photo_file_size, :photo_updated_at, :itemstate, :stateLast, :computername, :lastcal, :caldue, :comment, :price, :pbhr
  cattr_reader :per_page
  @@per_page = 20
  belongs_to :kit
  has_one :state
  belongs_to :location
  belongs_to :hrholder
  belongs_to :model
  has_attached_file :photo, :styles => {:small => "150x150>"}, :url => "/system/photos/:id/:style/:basename.:extension"

  def numitems
    #Item.count(:all, :group => 'category_id')
     Item.count(:all, :conditions => ['items.category_id = ?', category_id])

  end

  def end_of_life
     self.dateAcquired + self.model.servicelife
  end
 
  def name
       rfid
  end

  def csvofitems
    @items = Item.joins(:location, :model => [:make, :category]).order('locations.roomnum, categories.categoryName, makes.makeName, models.modelName, rfid')
    items_csv = FasterCSV.generate do |csv|
      csv << ["Name", "Location", "Make", "Model", "RFID", "Serial Number", "Barcode", "Date Acquired", "End of Life", "Created At", "Updated At", "State", "State Last", "Comment", "Computer Name", "Last Cal", "Cal Due", "Price", "PBHR"]

	      @items.each do |item|
	  csv << [item.model.category.categoryName, item.location.roomNum, item.model.make.makeName, item.model.modelName, item.rfid, item.serialNum, item.barcode, item.dateAcquired, item.end_of_life, item.created_at, item.updated_at, item.itemstate, item.stateLast, item.comment, item.computername, item.lastcal, item.caldue, item.price, item.pbhr]
			end	
	  end
	  
	end


  #validates_presence_of :rfid, :dateAcquired, :serialNum, :barcode, :originalValue, :model_id
  #validates_attachment_presence :photo
  validates_numericality_of :originalValue
  validates_uniqueness_of :rfid

end
