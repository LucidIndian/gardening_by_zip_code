require "application_system_test_case"

class GardensTest < ApplicationSystemTestCase
  setup do
    @garden = gardens(:one)
  end

  test "visiting the index" do
    visit gardens_url
    assert_selector "h1", text: "Gardens"
  end

  test "should create garden" do
    visit gardens_url
    click_on "New garden"

    fill_in "Description", with: @garden.description
    fill_in "Name", with: @garden.name
    fill_in "User", with: @garden.user_id
    fill_in "Zip", with: @garden.zip
    click_on "Create Garden"

    assert_text "Garden was successfully created"
    click_on "Back"
  end

  test "should update Garden" do
    visit garden_url(@garden)
    click_on "Edit this garden", match: :first

    fill_in "Description", with: @garden.description
    fill_in "Name", with: @garden.name
    fill_in "User", with: @garden.user_id
    fill_in "Zip", with: @garden.zip
    click_on "Update Garden"

    assert_text "Garden was successfully updated"
    click_on "Back"
  end

  test "should destroy Garden" do
    visit garden_url(@garden)
    click_on "Destroy this garden", match: :first

    assert_text "Garden was successfully destroyed"
  end
end
