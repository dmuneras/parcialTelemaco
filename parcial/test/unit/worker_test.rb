require 'test_helper'

class WorkerTest < ActiveSupport::TestCase
  def test_should_be_valid
    assert Worker.new.valid?
  end
end
