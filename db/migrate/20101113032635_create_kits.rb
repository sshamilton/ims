class CreateKits < ActiveRecord::Migration
  def self.up
    create_table :kits do |t|
      t.string :kitName
      t.integer :item_id
      t.text :kitDescription
      t.timestamps
    end
  end
  
  def self.down
    drop_table :kits
  end
end
