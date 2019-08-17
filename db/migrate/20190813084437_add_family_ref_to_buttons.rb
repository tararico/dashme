class AddFamilyRefToButtons < ActiveRecord::Migration[5.2]
  def change
    add_reference :buttons, :family, foreign_key: true
  end
end
