class AddNoxFieldsToItems < ActiveRecord::Migration
  def self.up
	  add_column :items, :itemstate, :string
	  add_column :items, :stateLast, :string
	  add_column :items, :comment, :text
	  add_column :items, :computername, :string
	  add_column :items, :lastcal, :datetime
	  add_column :items, :caldue, :datetime
	  add_column :items, :price, :string
	  add_column :items, :pbhr, :string
  end

  def self.down
	  remove_column :items, :state 
	  remove_column :items, :stateLast 
	  remove_column :items, :comment 
	  remove_column :items, :computername 
	  remove_column :items, :lastcal 
	  remove_column :items, :caldue 
	  remove_column :items, :price 
	  remove_column :items, :pbhr 
  end
end
