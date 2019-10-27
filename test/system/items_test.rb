require "application_system_test_case"

class ItemsTest < ApplicationSystemTestCase
  setup do
    visit login_url
    fill_in "email", with: "taira@example.com"
    fill_in "password", with: "hoge"
    click_on "commit"
    @button_a = buttons(:animonda)
    @button_s = buttons(:sheba)
    @item = items(:animonda)
  end

  test "visiting the index" do
    visit items_url
    assert_text "Home"
  end

  test "creating a Item" do
    visit buttons_url
    click_on "order_#{@button_s.id}"

    assert_text "リストに追加しました!"
  end

  test "updating a Item" do
    visit items_url
    click_on "item_edit_#{@item.id}"

    fill_in "item_description", with: "もうすぐなくなる"
    click_on "commit"

    assert_text "買い物の内容を変更しました"
  end

  test "destroying a Item" do
    visit items_url
    click_link "item_delete_#{@item.id}"
    page.driver.browser.switch_to.alert.accept

    assert_text "買い物リストが減りました！"
  end
end
