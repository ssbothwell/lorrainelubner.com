require 'test_helper'

class CvcatTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Cvcat.new.valid?
  end
end
