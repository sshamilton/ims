class UserHasRole < ActiveRecord::Base
  attr_accessible :user_id, :role_id

  belongs_to :role
  belongs_to :user

  validates_presence_of :user_id, :role_id
end
