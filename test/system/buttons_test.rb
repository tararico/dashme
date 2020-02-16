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
    find('label[for=nav-input]').click
    assert_text "ボタンをつくる"
  end

  test "creating a Button" do
    visit buttons_url
    find('label[for=nav-input]').click
    click_on('ボタンをつくる')
    fill_in "button_name", with: "シーバ"
    click_on "commit"

    assert_text "ボタンを作成しました"
  end

  test "creating a Button and listed Items" do
    visit buttons_url
    find('label[for=nav-input]').click
    click_on('ボタンをつくる')
    fill_in "button_name", with: "シーバ"
    click_on "create_item"

    assert_text "シーバを買い物リストに追加しました"
  end

  test "updating a Button" do
    visit edit_button_path(@button)

    fill_in "button_name", with: "アニモンダ？"
    click_on "commit"

    assert_text "ボタンを編集しました"
    assert_text "アニモンダ？"
  end

  test "destroying a Button" do
    visit buttons_url
    find('label[for=nav-input]').click
    click_on('ボタン編集')
    click_link "button_#{@button.id}"
    page.driver.browser.switch_to.alert.accept

    assert_text "ボタンを削除しました"
  end
end
