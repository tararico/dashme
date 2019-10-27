class User < ApplicationRecord
  authenticates_with_sorcery!

  belongs_to :family, optional: true
  accepts_nested_attributes_for :family, allow_destroy: true
  validates :password, length: { minimum: 4 }, if: -> { new_record? || changes[:crypted_password] }
  validates :password, confirmation: true, if: -> { new_record? || changes[:crypted_password] }
  validates :password_confirmation, presence: true, if: -> { new_record? || changes[:crypted_password] }
  validates :email, uniqueness: true

  def join_new_family(invitation_id)
    new_family_id = Invitation.find_by(id: invitation_id).family_id
    User.transaction do
      Button.where(family_id: family_id).update_all(family_id: new_family_id)
      update(family_id: new_family_id)
    end
  end
end
