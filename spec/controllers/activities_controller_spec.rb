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


  it "should contain title of activity" do
    activity = Activity.create!({title: "Rails Girls", description: "desc1", activity_date: Time.now, address: "add1"})
    get :edit, id: activity.id

    response.body.should =~ /Rails Girls/
  end

  it "should update activity" do
    activity = Activity.create!({title: "Rails Girls", description: "desc1", activity_date: Time.now, address: "add1"})
    put :update, id: activity.id, activity: {title: "Rails Girls Title", description: "description", address: "address", activity_date: Time.now}
    activity = assigns[:activity]
    activity.title.should eq("Rails Girls Title")
    response.should redirect_to(activity_path(activity.id))
  end

  it "should not update activity when the title is nil" do
    activity = Activity.create!({title: "Rails Girls", description: "desc1", activity_date: Time.now, address: "add1"})
    put :update, id: activity.id, activity: {title: "", description: "description", address: "address", activity_date: Time.now}
    response.body.should =~ /Title can.* be blank/
  end


  describe "GET activities list" do

    it "should show activity list view" do
      get :index
      response.should render_template('activities/index')
    end

    it "should contains activities" do
      rails_girls = create(:activity, title: 'Rails Girls')
      get :index
      assigns(:activities).should_not be_nil
      assigns(:activities).should include(rails_girls)
    end

    it "should order by activity date descendingly" do
      rails_girls = create(:activity, title: 'Rails Girls', activity_date: 2.days.ago)
      tech_lady = create(:activity, title: 'Rails Girls', activity_date: 1.days.ago)
      get :index
      assigns(:activities).first.should eql(tech_lady)
      assigns(:activities).last.should eql(rails_girls)
    end

    it "should contain title" do
      rails_girls = create(:activity, title: 'Rails Girls')
      get :index
      response.body.should =~ /#{rails_girls.title}/
    end

    it "should contain time" do
      create(:activity, activity_date: Time.gm(2008, 6, 21, 13, 30, 0))
      get :index
      response.body.should =~ /2008-06-21, 13:30:00/
    end

    it "should contain address" do
      address = 'Some Address You Should Know'
      create(:activity, address: address)
      get :index
      response.body.should =~ /#{address}/
    end

    it "should contain link to detail" do
      activity = create(:activity)
      get :index
      response.body.should =~ /#{activity_path(activity)}/
    end

  end
end












