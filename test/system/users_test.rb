require "application_system_test_case"

class UsersTest < ApplicationSystemTestCase
  setup do
    @user = users(:taira)
  end

  test "creating a User" do
    visit new_user_url

    fill_in "user_name", with: "たいたい"
    fill_in "user_family_attributes_name", with: "ないとぅ"
    fill_in "user_email", with: "taitai@example.com"
    fill_in "user_password", with: "hogehoge"
    fill_in "user_password_confirmation", with: "hogehoge"
    click_on "commit"

    assert_text "アカウントを作成しました"

    fill_in "email", with: "taitai@example.com"
    fill_in "password", with: "hogehoge"
    click_on "commit"

    assert_text "ボタン一覧"

    find('label[for=nav-input]').click
    click_on "アカウント情報変更"

    fill_in "user_name", with: "TaiTai"
    fill_in "user_password", with: "hogehoge"
    fill_in "user_password_confirmation", with: "hogehoge"
    click_on "commit"

    assert_text "情報を更新しました"
  end
end
