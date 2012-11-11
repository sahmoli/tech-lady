require 'spec_helper'

describe Img do

  it "should create img successfully" do
    FactoryGirl.create(:img).should be_valid
  end

  it "path can not be empty" do
    FactoryGirl.build(:img, :path => "").should_not be_valid
  end

end
