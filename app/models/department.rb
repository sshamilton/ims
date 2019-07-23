class Department < ActiveRecord::Base
  attr_accessible :departmentName, :location_id

  has_one :location
  belongs_to :profile

  validates_presence_of :departmentName, :location_id
  validates_uniqueness_of :departmentName

  def name
    departmentName
  end
end
