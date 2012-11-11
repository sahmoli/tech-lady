require 'spec_helper'

describe "imgs/index" do
  before(:each) do
    assign(:imgs, [
      stub_model(Img,
        :path => "Path",
        :description => "Description"
      ),
      stub_model(Img,
        :path => "Path",
        :description => "Description"
      )
    ])
  end

  it "renders a list of imgs" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Path".to_s, :count => 2
    assert_select "tr>td", :text => "Description".to_s, :count => 2
  end
end
