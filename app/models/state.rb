class State < ActiveRecord::Base
  attr_accessible :accountedFor, :missionCapable, :beingRepaired, :beingCalibrated, :disposed, :dateUpdated, :currentValue, :item_id

  belongs_to :item

  
end
