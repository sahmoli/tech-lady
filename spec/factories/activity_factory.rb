FactoryGirl.define do
  factory :activity do
    title "Rails title"
    description 'for test'
    address 'ThoughtWorks'
    activity_date Time.gm(2012, 11, 13, 9, 0, 0)
  end
end
