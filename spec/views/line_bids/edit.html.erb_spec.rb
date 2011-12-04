require 'spec_helper'

describe "line_bids/edit.html.erb" do
  before(:each) do
    @line_bid = assign(:line_bid, stub_model(LineBid,
      :bidding_id => 1,
      :bidcart_id => 1
    ))
  end

  it "renders the edit line_bid form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => line_bids_path(@line_bid), :method => "post" do
      assert_select "input#line_bid_bidding_id", :name => "line_bid[bidding_id]"
      assert_select "input#line_bid_bidcart_id", :name => "line_bid[bidcart_id]"
    end
  end
end
