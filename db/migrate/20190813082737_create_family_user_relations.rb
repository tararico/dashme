class CreateFamilyUserRelations < ActiveRecord::Migration[5.2]
  def change
    create_table :family_user_relations do |t|
      t.integer :user_id
      t.integer :family_id

      t.timestamps
    end
  end
end
