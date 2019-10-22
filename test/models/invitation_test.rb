require 'test_helper'

class InvitationTest < ActiveSupport::TestCase
  test " create_digest" do
    invitation = Invitation.create
    assert(invitation.invitation_digest == nil)
    invitation.create_digest
    assert_not(invitation.invitation_digest == nil)
  end

  test "authenticated?" do
    invitation = Invitation.create
    assert(invitation.authenticated?(invitation.invitation_token) == false)
    invitation.create_digest
    assert(invitation.authenticated?(invitation.invitation_token) == true)
    assert(invitation.authenticated?("token") == false)
  end

  test "expired?" do
    invitation = Invitation.create
    invitation.created_at = Time.zone.yesterday
    invitation.save
    assert(invitation.expired? == true)
    invitation.created_at = Time.zone.now
    invitation.save
    assert(invitation.expired? == false)
  end
end
