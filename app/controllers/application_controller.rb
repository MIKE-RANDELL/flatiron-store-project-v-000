class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  helper_method :current_cart, :checked_out?


  #def current_user
    #User.find_by_id(session["warden.user.user.key"][0])
  #end

  def current_cart
    if current_user.current_cart
      current_user.current_cart
    else
      return nil
    end
  end

  def checked_out?
    #current_cart.checked_out?
    self.current_cart.checked_out?
  end
end
