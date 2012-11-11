require 'spec_helper'

describe "imgs/new" do
  before(:each) do
    assign(:img, stub_model(Img,
      :path => "MyString",
      :description => "MyString"
    ).as_new_record)
  end

  it "renders new img form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form", :action => imgs_path, :method => "post" do
      assert_select "input#img_path", :name => "img[path]"
      assert_select "input#img_description", :name => "img[description]"
    end
  end
end
