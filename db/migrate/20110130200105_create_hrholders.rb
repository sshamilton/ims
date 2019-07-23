class CreateHrholders < ActiveRecord::Migration
  def self.up
    create_table :hrholders do |t|
      t.string :name

      t.timestamps
    end
  end

  def self.down
    drop_table :hrholders
  end
end
