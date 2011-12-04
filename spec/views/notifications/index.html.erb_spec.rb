require 'spec_helper'

describe "notifications/index.html.erb" do
  before(:each) do
    assign(:notifications, [
      stub_model(Notification),
      stub_model(Notification)
    ])
  end

  it "renders a list of notifications" do
    render
  end
end
