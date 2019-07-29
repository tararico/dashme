class Item < ApplicationRecord
  belongs_to :button
  after_create :button_disabled
  after_destroy :button_enable

  def button_disabled
    button.order_allowed = false
    button.save!
  end

  def button_enable
    button.order_allowed = true
    button.save!
  end
end
