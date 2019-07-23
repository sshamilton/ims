class CreateModels < ActiveRecord::Migration
  def self.up
    create_table :models do |t|
      t.string :modelName
      t.integer :make_id
      t.integer :category_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :models
  end
end
