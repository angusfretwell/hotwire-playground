require "application_system_test_case"

class BuildsTest < ApplicationSystemTestCase
  setup do
    @build = builds(:one)
  end

  test "visiting the index" do
    visit builds_url
    assert_selector "h1", text: "Builds"
  end

  test "should create build" do
    visit builds_url
    click_on "New build"

    fill_in "Title", with: @build.title
    click_on "Create Build"

    assert_text "Build was successfully created"
    click_on "Back"
  end

  test "should update Build" do
    visit build_url(@build)
    click_on "Edit this build", match: :first

    fill_in "Title", with: @build.title
    click_on "Update Build"

    assert_text "Build was successfully updated"
    click_on "Back"
  end

  test "should destroy Build" do
    visit build_url(@build)
    click_on "Destroy this build", match: :first

    assert_text "Build was successfully destroyed"
  end
end
