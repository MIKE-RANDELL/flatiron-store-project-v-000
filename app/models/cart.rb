class Cart < ActiveRecord::Base
  belongs_to :user
  has_many :line_items
  has_many :items, through: :line_items

  def set_checkout!
    self.checked_out = true
  end

  def checked_out?
    self.checked_out
  end

  def add_item(item)
    item = Item.find(item)
    line_item = self.line_items.find_by(item_id: item.id)
    if line_item
      line_item.quantity += 1
      line_item.save
    else
      line_item = self.line_items.create(quantity: 1, item_id: item.id)
    end
    line_item
  end

  def total
    price = 0
    line_items = self.line_items
    line_items.each do |item|
      the_item = Item.find_by(id: item[:item_id])
      item.quantity.times do |item|
        price += the_item.price
      end
    end
    price

    # items.inject(0){|sum, e| sum + e.price} #worked without quantity update
    #much quicker vs.
    # total = 0
    #self.items.each do |item|
    #  total += item.price
    #end
    #return total
  end

  #def add_item(item)
  #  item = Item.find(item)
  #  line_item = LineItem.create(item_id: item.id, cart_id: self.id)
  #  line_item
  #end
end
