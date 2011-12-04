require 'spec_helper'

describe "bidcarts/edit.html.erb" do
  before(:each) do
    @bidcart = assign(:bidcart, stub_model(Bidcart))
  end

  it "renders the edit bidcart form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bidcarts_path(@bidcart), :method => "post" do
    end
  end
end
