require "spec_helper"

describe ActivitiesController do

  it "should show activity list" do
    #given
    get :index
    response.should render_template('activities/index')
  end
end