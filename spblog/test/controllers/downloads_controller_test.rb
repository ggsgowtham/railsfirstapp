require 'test_helper'

class DownloadsControllerTest < ActionController::TestCase
  test "should get statistics" do
    get :statistics
    assert_response :success
  end

end
