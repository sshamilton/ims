class Role < ActiveRecord::Base
  attr_accessible :roleName, :roleDescription

  has_many :userHasRole
  has_many :user, :through => :userHasRole

  def name
    roleName
  end
  validates_presence_of :roleName
  validates_uniqueness_of :roleName
end
