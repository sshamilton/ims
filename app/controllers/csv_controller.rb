class CsvController < ApplicationController

  def import
  end
  def upload
	#(Load and authorize resource doesn't work on pure controllers (no model)
		if (can? :upload, :csv) 
			n_success = 0
			itemcsv = params[:upload][:csv].read
	    FasterCSV.parse(itemcsv) do |cells|
	      
				item = Item.new
				item.rfid = cells[0]
				item.location = Location.find_by_roomNum(cells[2])
				item.stateLast = cells[5]
				item.barcode = cells[6]
				item.model = Model.find_by_modelName(cells[8])
				item.serialNum = cells[9]
				item.hrholder = Hrholder.find_by_name(cells[10])
				item.comment = cells[11]
				item.computername = cells[12]
				item.dateAcquired= cells[15].to_i #This doesn't appear to work.  
				item.originalValue = cells[16]
				if item.save
					n_success = n_success + 1
					print("Saved")
				else
					print("Failed: " + item.errors.first.to_s)
					item.errors do |error|
						flash.now[:message] = error.to_s
					end
				end
	    end
			flash.now[:message] = "Imported #{n_success} rows into the database"
		end
  end
end
