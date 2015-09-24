require 'test_helper'

class ModelTest < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::Model::VERSION
  end
end
