class Activity < ActiveRecord::Base
  attr_accessible :activity_date, :address, :description, :title

  validates_presence_of :title, :activity_date, :address, :description

  default_scope order('created_at DESC')

end
