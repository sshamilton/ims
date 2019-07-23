class Profile < ActiveRecord::Base
  attr_accessible :lastName, :firstName, :rank, :department_id, :user_id

  has_one :user
  has_one :department

  validates_presence_of :lastName, :firstName, :department_id, :user_id
end
