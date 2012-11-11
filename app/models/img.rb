class Img < ActiveRecord::Base
  attr_accessible :description, :path, :load_image_file
  validates_presence_of :path, :message => "path can not be empty"
  before_create :creation_validate
  after_save :save_image
  PHOTO_STORE = File.join Rails.root, 'public', 'img'

  public

  def creation_validate
    if Img.all.size >= 4
      errors.add(:path, "can not upload more than 4 images")
      return false
    end
    return true
  end

  def load_image_file=(data)
    p data.methods
    p data
    self.path = data.original_filename
    @image_data = data
  end

  def save_image
    if @image_data
      name = File.join PHOTO_STORE, self.path
      File.open(name, 'wb') do |f|
        f.write(@image_data.read)
      end
      @image_data = nil
    end
  end

end
