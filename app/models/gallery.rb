class Gallery < ActiveRecord::Base
  mount_uploader :image, ImageUploader
  has_and_belongs_to_many :categories
  attr_accessor :crop_x, :crop_y, :crop_w, :crop_h
  after_update :crop_image
  validates :name, :presence => true
  validates :description, :length => { :maximum => 2048 }

  def crop_image
    image.recreate_versions! if crop_x.present?
  end

  def self.search(search)
  where("name LIKE ?", "%#{search}%") 
  # where("content LIKE ?", "%#{search}%")
end
  
end
