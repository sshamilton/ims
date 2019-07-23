class CreateStates < ActiveRecord::Migration
  def self.up
    create_table :states do |t|
      t.boolean :accountedFor
      t.boolean :missionCapable
      t.boolean :beingRepaired
      t.boolean :beingCalibrated
      t.boolean :disposed
      t.date :dateUpdated
      t.float :currentValue
      t.integer :item_id
      t.timestamps
    end
  end
  
  def self.down
    drop_table :states
  end
end
