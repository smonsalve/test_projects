class Photo < ActiveRecord::Base
  attr_accessible :description, :name, :image
  mount_uploader :image, ImageUploader
end
