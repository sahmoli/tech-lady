require "spec_helper"

describe HomeController do
  before :each do
    @activity_params = {:title => "Rails title",
                        :description => "xxx",
                        :address => "ThoughtWorks",
                        :activity_date => Time.now}
  end

  it "should return all the images when get index" do
    img = FactoryGirl.create(:img)
    get :index
    expect(assigns(:imgs)).to eq([img])
  end

  it "should return newest activity when get index" do
    activity_new = FactoryGirl.create(:activity, :activity_date => Time.new(2012,12,1,15,25,0))
    activity_old = FactoryGirl.create(:activity, :activity_date => Time.new(2012,11,12,15,25,0))

    get :index

    expect(assigns[:activity]).to eql(activity_new)

  end

end