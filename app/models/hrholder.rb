class Hrholder < ActiveRecord::Base
  has_many :items

  def items_by_location
     items.joins(:location, :model => [:make, :category]).order('locations.roomnum, categories.categoryName, makes.makeName, models.modelName, rfid')
     
  end

  def items_by_location_csv
     @items = items.joins(:location, :model => [:make, :category]).order('locations.roomnum, categories.categoryName, makes.makeName, models.modelName, rfid')
     items_csv = FasterCSV.generate do |csv|
       csv << ["Name", "Location", "Make", "Model", "RFID", "Serial Number", "Barcode"]
	
       @items.each do |item|
	  csv << [item.model.category.categoryName, item.location.roomNum, item.model.make.makeName, 		item.model.modelName, item.rfid, item.serialNum, item.barcode]
			end	
     end
    #FasterCSV.send_data(items_csv, :type => 'text/csv', :filename => Hrholder.name + '.csv')
  end


end
