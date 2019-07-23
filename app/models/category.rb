class Category < ActiveRecord::Base
  attr_accessible :categoryName
  cattr_reader :per_page
  @@per_page = 40
  #has_many :make_category
  has_many :makes, :through => :make_category
  has_many :models
  has_many :items, :through => :models

  def name
    categoryName
  end
  def self.search(search)
    if search
      find(:all, :conditions => ['categoryName LIKE ?', "%#{search}%"],  :order => 'categoryName')
    else
      find(:all, :order => 'categoryname')
    end
  end
  def self.searchbarcode(search)
    if search
      find(:all, :conditions => ['barcode LIKE ?', "%#{search}%"],  :order => 'categoryName')
    else
      find(:all, :order => 'categoryname')
    end
  end
  def self.searchserial(search)
    if search
      find(:all, :conditions => ['serialnum LIKE ?', "%#{search}%"],  :order => 'categoryName')
    else
      find(:all, :order => 'categoryname')
    end
  end


  def numitems
    Category.count(:make_id, :joins => "LEFT JOIN make_categories on categories.id = make_categories.category_id", :group => :category_id)
    
  end
  
    #acts_as_chainable :to => :make, :root => true


end
