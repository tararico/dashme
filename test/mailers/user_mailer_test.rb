require 'test_helper'

class UserMailerTest < ActionMailer::TestCase
  setup do
    @user = users(:fool)
  end

  test "reset_password_email" do
    mail = UserMailer.reset_password_email(@user)
    assert_equal "[DASHME]パスワードをリセットしました", mail.subject
    assert_equal [@user.email], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "パスワードリセットを受け付けました。", mail.body.encoded
  end
end
