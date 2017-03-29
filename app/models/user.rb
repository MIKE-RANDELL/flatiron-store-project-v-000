class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  has_many :carts
  belongs_to :current_cart, class_name: 'Cart', foreign_key: "current_cart_id"
  #ask a question about this ^^^^^^^
  def remove_current_cart
    self.current_cart = nil
    self.save
  end
end
