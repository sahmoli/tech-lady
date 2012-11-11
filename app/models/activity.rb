class Activity < ActiveRecord::Base
  attr_accessible :activity_date, :address, :description, :title
end
