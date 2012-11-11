class Img < ActiveRecord::Base
  attr_accessible :description, :path
  validates_presence_of :path, :message => "path can not be empty"
  before_create :creation_validate

  def creation_validate
    if Img.all.size >= 4
      errors.add(:path, "can not upload more than 4 images")
      return false
    end
    return true
  end
end
