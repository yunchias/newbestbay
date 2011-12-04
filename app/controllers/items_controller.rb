class ItemsController < ApplicationController


  require 'rubygems'
  require 'rufus/scheduler'

  before_filter :authenticate_user!, :except => [:show, :index, :cellphone]

  # GET /items
  # GET /items.json
  def index
    @items = Item.all
    @cart = current_cart

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @items }
    end
  end

  # GET /items/1
  # GET /items/1.json
  def show
    @item = Item.find(params[:id])
    @item1 = Item.find_all_by_id(params[:id])
    @cart = current_cart


    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @item }
    end
  end

  # GET /items/new
  # GET /items/new.json
  def new
    @item = Item.new
    5.times {@item.assets.build}
    @cart = current_cart


    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @item }
    end
  end

   def cellphone
       @items = Item.search(params[:search]).page(params[:page]).per_page(10)
       @cart = current_cart

      respond_to do |format|
      format.html # cellphone.html.erb
      format.json { render json: @items }
    end
   end

  # GET /items/1/edit
  def edit
    @item = Item.find(params[:id])
    5.times {@item.assets.build}
    @cart = current_cart

  end

  # POST /items
  # POST /items.json
  def create
    @item = Item.new(params[:item])
    @item.user_id = current_user.id
    @cart = current_cart

    respond_to do |format|
      if @item.save
        format.html { render action: "success" }
      else
        format.html { render action: "new" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end

    scheduler = Rufus::Scheduler.start_new
    puts "Scheduler started"
    scheduler.at @item.auction_end do
      puts "The auction has ended!"



      puts "Arnab Scheduler is working!!!" + @item.auction_end.to_s
  end

  end

  # PUT /items/1
  # PUT /items/1.json
  def update
    @item = Item.find(params[:id])
    @cart = current_cart


    respond_to do |format|
      if @item.update_attributes(params[:item])
        format.html { redirect_to @item, notice: 'Item was successfully updated.' }
        format.json { head :ok }
      else
        format.html { render action: "bidfail" }
        format.json { render json: @item.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /items/1
  # DELETE /items/1.json
  def destroy
    @item = Item.find(params[:id])
    @item.destroy
    @cart = current_cart


    respond_to do |format|
      format.html { redirect_to items_url }
      format.json { head :ok }
    end
  end
end
