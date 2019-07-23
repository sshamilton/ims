class CreateItems < ActiveRecord::Migration
  def self.up
    create_table :items do |t|
      t.string :rfid
      t.date :dateAcquired
      t.string :serialNum
      t.string :barcode
      t.float :originalValue
      t.integer :location_id
      t.integer :model_id
			t.integer :hrholder_id

      t.timestamps
    end
  end
  
  def self.down
    drop_table :items
  end
end
