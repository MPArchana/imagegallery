class CategoryGallery < ActiveRecord::Base
  belongs_to :category
  belongs_to :gallery
end
