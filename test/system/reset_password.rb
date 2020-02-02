require "application_system_test_case"

class ResetPasswordTest < ApplicationSystemTestCase
  setup do
    @user = users(:taira)
  end

  test "success password reset" do
    visit new_password_reset_path

    fill_in "email", with: @user.email
    click_on "commit"

    assert_text "パスワード再設定のメールを送信しました"

    reset_password_token = User.find(@user.id).reset_password_token
    visit edit_password_reset_url(reset_password_token)

    fill_in "user[password]", with: "calicali"
    fill_in "user[password_confirmation]", with: "calicali"

    click_on "commit"

    assert_text "パスワードの更新が完了しました"
  end

  test "coudn't sent instruction mail because wrong email" do
    visit new_password_reset_path

    fill_in "email", with: "uso@example.com"
    click_on "commit"

    assert_text "メールアドレスが間違っています"
  end
end
