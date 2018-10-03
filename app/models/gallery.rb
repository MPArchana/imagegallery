class Gallery < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_and_belongs_to_many :categories
  validates :name, :presence => true
  validates :description, :length => { :maximum => 2048 }
  
end
