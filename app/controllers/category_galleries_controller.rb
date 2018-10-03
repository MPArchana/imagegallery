class CategoryGalleriesController < ApplicationController
  def create
      @category_gallery = CategoryGallery.new(category_gallery_params)
      @category_gallery.save
      redirect_to gallery_path
  end

  private
    def category_gallery_params
      params.require(:category_gallery).permit(:category_id, :gallery_id)
    end
end
