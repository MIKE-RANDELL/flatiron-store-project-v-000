module ItemsHelper
  def actual_price(item_price)
    "$#{item_price.to_f/100}"
  end

  def inventory_check(item)
    item.inventory > 0
  end
end
