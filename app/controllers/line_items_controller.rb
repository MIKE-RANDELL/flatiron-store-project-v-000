class LineItemsController < ApplicationController
  def create
    item = Item.find(params[:item_id])
    user = current_user

    cart = user.current_cart || Cart.create(user_id: user.id)
    user.current_cart = cart #the model DB setter

    cart.add_item(params[:item_id])  #line_items.create(quantity: 1, item_id: item.id)
    user.save
    redirect_to cart_path(user.current_cart)
  end
end
