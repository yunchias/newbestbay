class BiddingsController < ApplicationController
  # GET /biddings
  # GET /biddings.json

  before_filter :authenticate_user!

  def index
    @biddings = Bidding.all
    @cart = current_cart

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @biddings }
    end
  end

  # GET /biddings/1
  # GET /biddings/1.json
  def show
    @bidding = Bidding.find(params[:id])
    @bidding1 = Bidding.find_all_by_id(params[:id])
    @cart = current_cart

    @item = Bidding.find(params[:id]).item


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @bidding }
    end
  end

  # GET /biddings/new
  # GET /biddings/new.json
  def new
    @bidding = Bidding.new
    @item = Item.new(params[:item])
    @bidding.user_id = current_user.id
    @bidding.item_name = @item.item_name
    @bidding.item_id = @item.id
    @bidding.item_desc = @item.item_desc
    @bidding.item_cond = @item.item_cond
    @cart = current_cart

    @bidding.save



    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bidding }
    end
  end


   def directbuy
    @bidding = Bidding.new
    @item = Item.new(params[:item])
    @bidding.user_id = current_user.id
    @bidding.item_name = @item.item_name
    @bidding.item_id = @item.id
    @bidding.item_desc = @item.item_desc
    @bidding.item_cond = @item.item_cond
    @cart = current_cart


    @bidding.save



    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @bidding }
    end
  end



  def notifications

    @biddings = Bidding.where(:user_id => current_user.id)

    @cart = current_cart



      respond_to do |format|
      format.html # cellphone.html.erb
      format.json { render json: @biddings }
    end
   end

  # GET /biddings/1/edit
  def edit

    @bidding = Bidding.find(params[:id])
    @cart = current_cart


  end

  # POST /biddings
  # POST /biddings.json
  def create
    @bidding = Bidding.new(params[:bidding])




    respond_to do |format|
      if @bidding.save
        format.html { redirect_to @bidding, notice: 'Bidding was successfully created.' }
        format.json { render json: @bidding, status: :created, location: @bidding }
      else
        format.html { render action: "new" }
        format.json { render json: @bidding.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /biddings/1
  # PUT /biddings/1.json
  def update
    @bidding = Bidding.find(params[:id])
    @cart = current_cart

    @item = Bidding.find(params[:id]).item

    @bidding1 = Bidding.where(:item_id => @bidding.item_id)

  #  Bidding.find(params[:id]).item.update_attributes(@item.item_price = @bidding.bid_price)

   # Orders.find(ORDER_ID).user.update_attributes(:billing_id => BILLING_ID)

   # Item.find(@bidding.item_id).update_attributes(:item_id => @bidding.id)


    if (@item.auction_end <= Time.now)
       Item.find(@bidding.item_id).update_attributes(:flags => "Auction Closed")
    end



    respond_to do |format|
      if (@bidding.update_attributes(params[:bidding]) && @item.item_price < @bidding.bid_price && Item.find(@bidding.item_id).update_attributes(:item_price => @bidding.bid_price))



        @bidding1.each do |bid|
         bid.update_attributes(:bid_status => "Not the highest")
        end



        if ( @item.auction_end <= Time.now )
          Item.find(@bidding.item_id).update_attributes(:flags => "Auction closed")
        end

        @bidding.update_attributes(:bid_status => "Highest")


        format.html { redirect_to @bidding, notice: 'Your bidding has been successfully updated.' }
        format.json { head :ok }
      else
        @bidding.destroy
        format.html { render action: "bidfail" }
        format.json { render json: @bidding.errors, status: :unprocessable_entity }
      end

    end



  end

  # DELETE /biddings/1
  # DELETE /biddings/1.json
  def destroy
    @bidding = Bidding.find(params[:id])
    @bidding.destroy
    @cart = current_cart

    respond_to do |format|
      format.html { redirect_to biddings_url }
      format.json { head :ok }
    end
  end
end
