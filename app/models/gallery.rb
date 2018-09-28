class Gallery < ActiveRecord::Base
  has_and_belongs_to_many :categories, dependent: :destroy
  mount_uploader :image, ImageUploader
   validates :description, :length => { :maximum => 2048 }
end
