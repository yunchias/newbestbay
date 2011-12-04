require 'spec_helper'

describe "line_bids/index.html.erb" do
  before(:each) do
    assign(:line_bids, [
      stub_model(LineBid,
        :bidding_id => 1,
        :bidcart_id => 1
      ),
      stub_model(LineBid,
        :bidding_id => 1,
        :bidcart_id => 1
      )
    ])
  end

  it "renders a list of line_bids" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => 1.to_s, :count => 2
  end
end
