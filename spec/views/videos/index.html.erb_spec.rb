require 'spec_helper'

describe "videos/index.html.erb" do
  before(:each) do
    assign(:videos, [
      stub_model(Video,
        :title => "Title",
        :panda_video_id => "Panda Video"
      ),
      stub_model(Video,
        :title => "Title",
        :panda_video_id => "Panda Video"
      )
    ])
  end

  it "renders a list of videos" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Title".to_s, :count => 2
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Panda Video".to_s, :count => 2
  end
end
