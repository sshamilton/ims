require 'test_helper'

class UserHasRoleTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert UserHasRole.new.valid?
  end
end
