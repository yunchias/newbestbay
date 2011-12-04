require 'spec_helper'

describe "biddings/new.html.erb" do
  before(:each) do
    assign(:bidding, stub_model(Bidding).as_new_record)
  end

  it "renders new bidding form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => biddings_path, :method => "post" do
    end
  end
end
