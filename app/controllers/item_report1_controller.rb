class ItemReport1Controller < ApplicationController
  load_and_authorize_resource
  def index
    @makes = Make.all
    @categories = Category.all
    @make_has_categories = MakeCategory.all
  end
end
