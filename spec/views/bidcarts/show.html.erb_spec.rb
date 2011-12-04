require 'spec_helper'

describe "bidcarts/show.html.erb" do
  before(:each) do
    @bidcart = assign(:bidcart, stub_model(Bidcart))
  end

  it "renders attributes in <p>" do
    render
  end
end
