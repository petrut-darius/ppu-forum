require "application_system_test_case"

class SubforumsTest < ApplicationSystemTestCase
  setup do
    @subforum = subforums(:one)
  end

  test "visiting the index" do
    visit subforums_url
    assert_selector "h1", text: "Subforums"
  end

  test "should create subforum" do
    visit subforums_url
    click_on "New subforum"

    fill_in "Description", with: @subforum.description
    fill_in "Title", with: @subforum.title
    click_on "Create Subforum"

    assert_text "Subforum was successfully created"
    click_on "Back"
  end

  test "should update Subforum" do
    visit subforum_url(@subforum)
    click_on "Edit this subforum", match: :first

    fill_in "Description", with: @subforum.description
    fill_in "Title", with: @subforum.title
    click_on "Update Subforum"

    assert_text "Subforum was successfully updated"
    click_on "Back"
  end

  test "should destroy Subforum" do
    visit subforum_url(@subforum)
    click_on "Destroy this subforum", match: :first

    assert_text "Subforum was successfully destroyed"
  end
end
