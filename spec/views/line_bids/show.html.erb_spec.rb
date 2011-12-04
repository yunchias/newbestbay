require 'spec_helper'

describe "line_bids/show.html.erb" do
  before(:each) do
    @line_bid = assign(:line_bid, stub_model(LineBid,
      :bidding_id => 1,
      :bidcart_id => 1
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/1/)
  end
end
