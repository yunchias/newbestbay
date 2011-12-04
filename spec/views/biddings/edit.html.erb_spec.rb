require 'spec_helper'

describe "biddings/edit.html.erb" do
  before(:each) do
    @bidding = assign(:bidding, stub_model(Bidding))
  end

  it "renders the edit bidding form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => biddings_path(@bidding), :method => "post" do
    end
  end
end
