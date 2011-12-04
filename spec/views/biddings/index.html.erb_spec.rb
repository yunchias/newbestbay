require 'spec_helper'

describe "biddings/index.html.erb" do
  before(:each) do
    assign(:biddings, [
      stub_model(Bidding),
      stub_model(Bidding)
    ])
  end

  it "renders a list of biddings" do
    render
  end
end
