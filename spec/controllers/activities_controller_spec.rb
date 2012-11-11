require "spec_helper"

describe ActivitiesController do
  render_views
  before :each do
    @activity_params = {:title => "Rails title",
                       :description => "xxx",
                       :address => "ThoughtWorks",
                       :activity_date => Time.now}
  end

  it "should return a form  when get new" do
    get :new
    assigns[:activity].should be_an_instance_of(Activity)
  end

  it "should save activity successfully" do
    post :create, :activity => @activity_params

    activity = assigns[:activity]
    activity.title.should eq("Rails title")
    response.should redirect_to(activity_path(activity.id))
  end

  it "should not save when title lost" do
    @activity_params[:title] = nil
    post :create, :activity => @activity_params
    response.should redirect_to(new_activity_path)
  end

  it "should show activity list" do
    #given
    get :index
    response.should render_template('activities/index')
  end

  it "should contains activities" do
    Activity.create!({title:"1", description:"desc1", activity_date:Time.now, address:"add1"})
    Activity.create!({title:"2", description:"desc2", activity_date:Time.now, address:"add2"})
    Activity.create!({title:"3", description:"desc3", activity_date:Time.now, address:"add3"})
    get :index
    assigns(:activities).should_not be_nil
  end

  it "should contain name" do
    Activity.create!({title:"Rails Girls", description:"desc1", activity_date:Time.now, address:"add1"})
    get :index

    response.body.should =~ /Rails Girls/
  end
end