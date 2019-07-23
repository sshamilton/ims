require 'test_helper'

class HandReceiptTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert HandReceipt.new.valid?
  end
end
