class Kit < ActiveRecord::Base
  attr_accessible :kitName, :item_id, :kitDescription

  has_many :item

  validates_presence_of :kitName
  
end
