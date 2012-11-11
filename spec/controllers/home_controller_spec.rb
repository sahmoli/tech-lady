require "spec_helper"

describe HomeController do
  it "should return all the images when get index" do
    img = FactoryGirl.create(:img)
    get :index
    expect(assigns(:imgs)).to eq([img])
  end
end