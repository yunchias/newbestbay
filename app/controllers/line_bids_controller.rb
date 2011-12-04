class LineBidsController < InheritedResources::Base

def create
@bidcart = current_bidcart
bidding = Bidding.find(params[:bidding_id])

@line_bid = @bidcart.add_bidding(bidding.id)
respond_to do |format|
if @line_bid.save
  format.html { redirect_to(@line_bid.bidcart) }
format.xml { render :xml => @line_bid,
:status => :created, :location => @line_bid }
else
format.html { render :action => "new" }
format.xml { render :xml => @line_bid.errors,
:status => :unprocessable_entity }
end
end
end

end
