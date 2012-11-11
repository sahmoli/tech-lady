require 'spec_helper'

describe Activity do

  before :each do
    @activity_params = {:title => "Rails title",
                       :description => "xxx",
                       :address => "ThoughtWorks",
                       :activity_date => Time.now}
  end

  def check_save(activity)
    activity.save
  end


  it "should create a new activity and save to database" do
    Activity.create(@activity_params)

    activity = Activity.find_by_title "Rails title"

    activity.title.should == "Rails title"

  end

  it "should not create a new activity without title" do
    @activity_params[:title] = nil
    check_save(Activity.new(@activity_params)).should be_false
  end


  it "should not create a new activity without description" do
    @activity_params[:description] = nil
    check_save(Activity.new(@activity_params)).should be_false
  end

  it "should not create a new activity without address" do
    @activity_params[:address] = nil
    check_save(Activity.new(@activity_params)).should be_false
  end


  it "should not create a new activity without activity_time" do
    @activity_params[:activity_date] = nil
    check_save(Activity.new(@activity_params)).should be_false
  end

end
