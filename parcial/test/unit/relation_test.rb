require 'test_helper'

class RelationTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Relation.new.valid?
  end
end
