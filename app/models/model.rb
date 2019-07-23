class Model < ActiveRecord::Base
  attr_accessible :modelName, :make_id, :category_id, :photo
  cattr_reader :per_page
  @@per_page = 40
  belongs_to :make
  has_many :items
  belongs_to :category
  has_attached_file :photo, :styles => {:small => "150x150>"}, :url => "/system/photos/:id/:style/:basename.:extension"
 
  def name
    modelName
  end
  
  #acts_as_chainable :from => :make

  #validates_presence_of :modelName, :make_id, :category_id
  validates_uniqueness_of :modelName
end
