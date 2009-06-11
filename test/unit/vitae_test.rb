require 'test_helper'

class VitaeTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Vitae.new.valid?
  end
end
