class CartsController < InheritedResources::Base

  before_filter :authenticate_user!


def show
begin
@cart = Cart.find(params[:id])
rescue ActiveRecord::RecordNotFound
logger.error "Attempt to access invalid cart #{params[:id]}"
redirect_to item_url, :notice => 'Invalid cart'
else
respond_to do |format|
format.html # show.html.erb
format.xml { render :xml => @cart }
end
end
end

def destroy
@cart = Cart.find(params[:id])
@cart.destroy
session[:cart_id] = nil
respond_to do |format|
format.html { redirect_to(items_url,
:notice => 'Your cart is currently empty') }
format.xml { head :ok }
end
end


  end