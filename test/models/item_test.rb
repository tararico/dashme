require 'test_helper'

class ItemTest < ActiveSupport::TestCase
  test "button_desabled" do
    item = items(:item1)
    item.button_disabled
    assert( item.button.order_allowed == false )

    item = items(:item2)
    item.button_disabled
    assert( item.button.order_allowed  == false )
  end

  test "button_enable" do
    item = items(:item1)
    item.button_enable
    assert( item.button.order_allowed == true )

    item = items(:item2)
    item.button_enable
    assert( item.button.order_allowed  == true )
  end
end
