require_relative 'test_helper'

class AiTest < Minitest::Test

  def test_it_is_an_ai
    ai = Ai.new

    assert_instance_of Ai, ai
  end

  def test_it_has_a_name
    ai = Ai.new

    assert_equal ai.name, 'Bob'
  end
end