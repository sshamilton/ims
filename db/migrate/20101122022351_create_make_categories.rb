class CreateMakeCategories < ActiveRecord::Migration
  def self.up
    create_table :make_categories do |t|
      t.integer :make_id
      t.integer :category_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :make_categories
  end
end
