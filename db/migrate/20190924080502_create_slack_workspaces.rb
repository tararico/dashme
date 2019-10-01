class CreateSlackWorkspaces < ActiveRecord::Migration[5.2]
  def change
    create_table :slack_workspaces do |t|
      t.string :webhook_url
      t.references :family, foreign_key: true

      t.timestamps
    end
  end
end
