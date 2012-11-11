
FactoryGirl.define do
  factory :activity do
    title "Rails title"
    description 'for test'
    address 'ThoughtWorks'
    activity_date Time.now
  end

end
