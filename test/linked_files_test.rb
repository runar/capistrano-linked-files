require_relative 'test_helper'

class LinkedFilesTest < UnitTest
  def test_that_default_role_is_set
    assert_equal :all, fetch(:upload_roles)
  end
end
