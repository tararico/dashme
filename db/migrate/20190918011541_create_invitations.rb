class CreateInvitations < ActiveRecord::Migration[5.2]
  def change
    create_table :invitations do |t|
      t.string :invitation_digest
      t.boolean :sign_up, default: false
      t.references :family, foreign_key: true

      t.timestamps
    end
  end
end
