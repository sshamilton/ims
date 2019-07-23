class Make < ActiveRecord::Base
  attr_accessible :makeName
  cattr_reader :per_page
  @@per_page = 40
  has_many :models
  has_many :make_category
  has_many :categories, :through => :make_category

  def name
    makeName
  end

  #acts_as_chainable :from => :category, :to => :model 

  validates_presence_of :makeName
  validates_uniqueness_of :makeName
end
