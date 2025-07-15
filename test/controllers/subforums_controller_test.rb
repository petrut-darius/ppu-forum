require "test_helper"

class SubforumsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @subforum = subforums(:one)
  end

  test "should get index" do
    get subforums_url
    assert_response :success
  end

  test "should get new" do
    get new_subforum_url
    assert_response :success
  end

  test "should create subforum" do
    assert_difference("Subforum.count") do
      post subforums_url, params: { subforum: { description: @subforum.description, title: @subforum.title } }
    end

    assert_redirected_to subforum_url(Subforum.last)
  end

  test "should show subforum" do
    get subforum_url(@subforum)
    assert_response :success
  end

  test "should get edit" do
    get edit_subforum_url(@subforum)
    assert_response :success
  end

  test "should update subforum" do
    patch subforum_url(@subforum), params: { subforum: { description: @subforum.description, title: @subforum.title } }
    assert_redirected_to subforum_url(@subforum)
  end

  test "should destroy subforum" do
    assert_difference("Subforum.count", -1) do
      delete subforum_url(@subforum)
    end

    assert_redirected_to subforums_url
  end
end
