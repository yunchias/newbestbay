require 'spec_helper'

describe "reports/index.html.erb" do
  before(:each) do
    assign(:reports, [
      stub_model(Report),
      stub_model(Report)
    ])
  end

  it "renders a list of reports" do
    render
  end
end
