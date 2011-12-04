require 'spec_helper'

describe "videos/edit.html.erb" do
  before(:each) do
    @video = assign(:video, stub_model(Video,
      :title => "MyString",
      :panda_video_id => "MyString"
    ))
  end

  it "renders the edit video form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => videos_path(@video), :method => "post" do
      assert_select "input#video_title", :name => "video[title]"
      assert_select "input#video_panda_video_id", :name => "video[panda_video_id]"
    end
  end
end
