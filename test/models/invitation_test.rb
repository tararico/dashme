require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  test " create_digest" do
    invitation = Invitation.create
    assert(invitation.invitation_digest == nil)
    invitation.create_digest
    assert_not(invitation.invitation_digest == nil)
  end

  test "authenticated?" do
    # invitation_digest.nilだったら、falseを返すこと
    #invitation_digestとinvitation_tokenを暗号化たものが一致していたらtrueを返すこと
    #一致していなかったらfalseを返すこと

  end

  test "expired?" do
    #24時間以上立っていたらfalseを返す(24時間の以降のレコードを作る)
    #以内だったらtrueを返す
  end

end
