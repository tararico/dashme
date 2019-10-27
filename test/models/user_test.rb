require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test "join_new_family" do
    kazue = users(:kazue)
    masaharu = users(:masaharu)
    invitation = invitations(:invitation_fukuyama)
    kazue.join_new_family(invitation.id)
    assert(kazue.family_id == masaharu.family_id)
    assert(kazue.family.buttons.map(&:name).sort == ["レグザ", "ｱｻﾋｨｽｩﾊﾟｧﾄﾞｩﾙｧｧｧｧｲ"])
  end
end
