require 'spec_helper'

describe "biddings/show.html.erb" do
  before(:each) do
    @bidding = assign(:bidding, stub_model(Bidding))
  end

  it "renders attributes in <p>" do
    render
  end
end
