class LineItem < ActiveRecord::Base
  belongs_to :item
  belongs_to :cart

  def update(item, quantity)
    item.inventory -= quantity
    item.save
  end
end
