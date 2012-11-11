require 'spec_helper'


describe "activities/edit" do
  before(:each) do
    @activity = assign(:activity, stub_model(Activity,
                                             :activity_date=> Time.now,
                                             :address=> "Activity Address",
                                             :description=> "Activity description",
                                             :title=> "Activity title"
    ))
  end

  it "should render edit activity form" do
    render
    assert_select "form", :action => activities_path(@activity), :method => "post" do
      assert_select "input#activity_title", :name => "activity[title]"
      assert_select "textarea#activity_description", :name => "activity[description]"
      assert_select "input#activity_address", :name => "activity[address]"
      assert_select "select#activity_activity_date_1i", :name => "activity[activity_date(1i)]"
    end
  end
end