require 'spec_helper'

describe "imgs/show" do
  before(:each) do
    @img = assign(:img, stub_model(Img,
      :path => "Path",
      :description => "Description"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Path/)
    rendered.should match(/Description/)
  end
end
