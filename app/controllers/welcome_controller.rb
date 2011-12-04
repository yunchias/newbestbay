class WelcomeController < ApplicationController
   def homepage
     @cart = current_cart
     @bidcart = current_bidcart

  end
end
