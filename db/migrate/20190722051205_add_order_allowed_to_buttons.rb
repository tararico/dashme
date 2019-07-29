class AddOrderAllowedToButtons < ActiveRecord::Migration[5.2]
  def change
    add_column :buttons, :order_allowed, :boolean, default: true, null: false
  end
end
