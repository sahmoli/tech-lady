class Img < ActiveRecord::Base
  attr_accessible :description, :path
  validates_presence_of :path, :message => "path can not be empty"
end
