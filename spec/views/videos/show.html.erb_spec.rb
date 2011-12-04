require 'spec_helper'

describe "videos/show.html.erb" do
  before(:each) do
    @video = assign(:video, stub_model(Video,
      :title => "Title",
      :panda_video_id => "Panda Video"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Title/)
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Panda Video/)
  end
end
