require "application_system_test_case"

class ButtonsTest < ApplicationSystemTestCase
  include Sorcery::TestHelpers::Rails::Integration

  setup do
    visit login_url
    fill_in "email", with: "taira@example.com"
    fill_in "password", with: "hoge"
    click_on "commit"
    @button = buttons(:animonda)
  end

  test "visiting the index" do
    visit buttons_url
    assert_text "New Button"
  end

  test "creating a Button" do
    visit buttons_url
    click_on "New Button"

    fill_in "button_name", with: "シーバ"
    click_on "commit"

    assert_text "Button was successfully created"
    click_on "Back"
  end

  test "updating a Button" do
    visit edit_button_path(@button)

    fill_in "button_name", with: "アニモンダ？"
    click_on "commit"

    assert_text "Button was successfully updated"
    assert_text "アニモンダ？"
    click_on "Back"
  end

  test "destroying a Button" do
    visit buttons_url
    click_link "button_#{@button.id}"
    page.driver.browser.switch_to.alert.accept

    assert_text "Button was successfully destroyed"
  end
end
