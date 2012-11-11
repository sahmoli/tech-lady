require 'spec_helper'

describe "Activities" do
  let(:activity) { FactoryGirl.create(:activity) }

  subject { page }

  describe "should have activities" do
    before do
      activity.save
      visit activity_path(activity)
    end

    describe "should have activity details" do
      it { should have_content activity.title }
      it { should have_content activity.description }
      it { should have_content activity.activity_date}
      it { should have_content activity.address}
    end
  end

end
