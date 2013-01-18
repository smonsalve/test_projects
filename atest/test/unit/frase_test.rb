require 'test_helper'

class FraseTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Frase.new.valid?
  end
end
