require 'spec_helper'

describe "reports/show.html.erb" do
  before(:each) do
    @report = assign(:report, stub_model(Report))
  end

  it "renders attributes in <p>" do
    render
  end
end
