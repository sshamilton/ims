class AddServicelifeToModel < ActiveRecord::Migration
  def self.up
    add_column :models, :servicelife, :integer
  end

  def self.down
    remove_column :models, :servicelife
  end
end
