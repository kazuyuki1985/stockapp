require 'test_helper'

class EvernoteControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get evernote_new_url
    assert_response :success
  end

end
