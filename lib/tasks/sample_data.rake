namespace :db do
  desc "Create many activities"
  task populate: :environment do
    Activity.create(
      title: "Rails Girls",
      description: "Rails Girls Description",
      address: "Software park",
      activity_date: "2012-11-11"
    )
  end
end
