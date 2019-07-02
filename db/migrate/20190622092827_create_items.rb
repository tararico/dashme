class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :description
      t.references :button, foreign_key: true

      t.timestamps
    end
  end
end
