require 'test_helper'

class MakeCategoryTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert MakeCategory.new.valid?
  end
end
