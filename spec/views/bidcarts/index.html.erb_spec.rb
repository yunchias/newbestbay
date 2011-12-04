require 'spec_helper'

describe "bidcarts/index.html.erb" do
  before(:each) do
    assign(:bidcarts, [
      stub_model(Bidcart),
      stub_model(Bidcart)
    ])
  end

  it "renders a list of bidcarts" do
    render
  end
end
