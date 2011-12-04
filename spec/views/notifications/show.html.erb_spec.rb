require 'spec_helper'

describe "notifications/show.html.erb" do
  before(:each) do
    @notification = assign(:notification, stub_model(Notification))
  end

  it "renders attributes in <p>" do
    render
  end
end
