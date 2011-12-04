class BidcartsController < InheritedResources::Base

def show
begin
@bidcart = Bidcart.find(params[:id])
rescue ActiveRecord::RecordNotFound
logger.error "Attempt to access invalid cart #{params[:id]}"
redirect_to bidding_url, :notice => 'Invalid cart'
else
respond_to do |format|
format.html # show.html.erb
format.xml { render :xml => @bidcart }
end
  end
end

def destroy
@bidcart = Bidcart.find(params[:id])
@bidcart.destroy
session[:bidcart_id] = nil
respond_to do |format|
format.html { redirect_to(bidding_url,
:notice => 'Your Bid cart is currently empty') }
format.xml { head :ok }
end
end


end
