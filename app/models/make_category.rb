class MakeCategory < ActiveRecord::Base
  attr_accessible :make_id, :category_id

  belongs_to :make
  belongs_to :category



  def name
   :category_id
  end
  # validates_presence_of :make_id, :category_id
end
