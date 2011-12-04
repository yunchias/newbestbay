require 'spec_helper'

describe "bidcarts/new.html.erb" do
  before(:each) do
    assign(:bidcart, stub_model(Bidcart).as_new_record)
  end

  it "renders new bidcart form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => bidcarts_path, :method => "post" do
    end
  end
end
