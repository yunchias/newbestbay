class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

private
  def current_cart
  Cart.find(session[:cart_id])
  rescue ActiveRecord::RecordNotFound
  cart = Cart.create
  session[:cart_id] = cart.id
  cart
  end




def current_bidcart
  Bidcart.find(session[:bidcart_id])
  rescue ActiveRecord::RecordNotFound
  bidcart = Bidcart.create
  session[:bidcart_id] = bidcart.id
  bidcart
end




end
