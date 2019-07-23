class Location < ActiveRecord::Base
  attr_accessible :roomNum


  has_many :items
  belongs_to :department



  def name
    roomNum
  end

    validates_presence_of :roomNum
    validates_uniqueness_of :roomNum
end
