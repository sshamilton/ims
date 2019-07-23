require 'test_helper'

class ItemClassTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert ItemClass.new.valid?
  end
end
