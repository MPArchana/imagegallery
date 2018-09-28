class Gallery < ActiveRecord::Base
  mount_uploader :image, ImageUploader
   validates :description, :length => { :maximum => 2048 }
end
