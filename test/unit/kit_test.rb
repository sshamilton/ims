require 'test_helper'

class KitTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Kit.new.valid?
  end
end
