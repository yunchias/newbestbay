class ReportsController < ApplicationController

 before_filter :authenticate_admin!, :except => [:show, :index]


   def auctionreport
     @totalauction = Item.where("auction_end >= ?", Date.today).size
     @closeauction = Item.where("auction_end < ?", Date.today).size
     @items = Item.where("auction_end >= ?", Date.today)
     @groupitems = Item.select("category_name").group("category_name").count
     @typeitems =  Item.select("flags").group("flags").count


   end

  def usereport
    @totaluser = User.find(:all)
    @totalseller = User.where("purpose=?", "Posting").size
    @totalbuyer = User.where("purpose=?", "Bidding").size
    @totalnewuser = User.where("created_at>=?",  Date.today-7.days).size
    @totaldeac = User.where("status=?","D").size
    @totalactiveuser = User.where("last_sign_in_at>=?", Date.today - 30.days).size
   # @userincrate = (@totalnewuser.to_i)/@totaluser
    #@decrate = @totaldeac/@totaluser
    #@actuserate = @totalactiveuser/@totaluser
      @userincrate = 3/5
    @decrate = 3/5
    @actuserate = 3/5
  end

 def biddingreport
   @autionitems = Bidding.select("DISTINCT(item_id),user_id,count(*) as count").group("user_id")



 end



  # GET /reports
  # GET /reports.json
  def index
    @reports = Report.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @reports }
    end
  end

  # GET /reports/1
  # GET /reports/1.json
  def show
    @report = Report.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/new
  # GET /reports/new.json
  def new
    @report = Report.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @report }
    end
  end

  # GET /reports/1/edit
  def edit
    @report = Report.find(params[:id])
  end

  # POST /reports
  # POST /reports.json
  def create
    @report = Report.new(params[:report])

    respond_to do |format|
      if @report.save
        format.html { redirect_to @report, notice: 'Report was successfully created.' }
        format.json { render json: @report, status: :created, location: @report }
      else
        format.html { render action: "new" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /reports/1
  # PUT /reports/1.json
  def update
    @report = Report.find(params[:id])

    respond_to do |format|
      if @report.update_attributes(params[:report])
        format.html { redirect_to @report, notice: 'Report was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @report.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reports/1
  # DELETE /reports/1.json
  def destroy
    @report = Report.find(params[:id])
    @report.destroy

    respond_to do |format|
      format.html { redirect_to reports_url }
      format.json { head :ok }
    end
  end
end