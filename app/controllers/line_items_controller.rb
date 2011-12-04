class LineItemsController < InheritedResources::Base

def create
  @cart = current_cart
  item = Item.find(params[:item_id])
  @line_item = @cart.add_item(item.id)
  respond_to do |format|
    if @line_item.save
      format.html { redirect_to(@line_item.cart)}
      format.xml { render :xml => @line_item,
        :status => :created, :location => @line_item }
    else
      format.html { render :action => "new" }
      format.xml { render :xml => @line_item.errors,
        :status => :unprocessable_entity }
    end
  end
end


end
