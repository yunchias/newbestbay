require 'spec_helper'

describe "line_bids/new.html.erb" do
  before(:each) do
    assign(:line_bid, stub_model(LineBid,
      :bidding_id => 1,
      :bidcart_id => 1
    ).as_new_record)
  end

  it "renders new line_bid form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => line_bids_path, :method => "post" do
      assert_select "input#line_bid_bidding_id", :name => "line_bid[bidding_id]"
      assert_select "input#line_bid_bidcart_id", :name => "line_bid[bidcart_id]"
    end
  end
end
