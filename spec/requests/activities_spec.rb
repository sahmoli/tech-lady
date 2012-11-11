require 'spec_helper'

describe "Activities" do
  let(:activity) { FactoryGirl.create(:activity) }

  subject { page }

  describe "should have activities" do
    before do
      activity.activity_date = Time.new(2008,6,21, 13,30,0, "+00:00")
      activity.save
      visit activity_path(activity)
    end

    describe "should have activity details" do
      it { should have_content activity.title }
      it { should have_content activity.description }
      it { should have_content "2008-06-21, 13:30:00"}
      it { should have_content activity.address}
    end

  end

end
