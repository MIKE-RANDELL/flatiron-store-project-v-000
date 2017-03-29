class CartsController < ApplicationController
  def show
    @cart = Cart.find(params[:id])
    @user = current_user
  end

  def checkout
    @cart = Cart.find(params[:id])
    update_inventory(@cart.line_items)
    @cart.set_checkout!

    @cart.user.remove_current_cart

    @cart.save

    redirect_to cart_path(@cart)
  end

  def create
    #binding.pry
    current_user.current_cart = Cart.create(user_id: params[:user_id])
    current_user.save
    redirect_to store_path
  end

  private
  def update_inventory(line_items)
    line_items.each do |line_item|
      line_item.update(line_item.item, line_item.quantity)
    end
  end
end
