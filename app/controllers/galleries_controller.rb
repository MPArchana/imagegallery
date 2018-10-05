class GalleriesController < ApplicationController
  before_action :set_gallery, only: [:show, :edit, :update, :destroy, :multiple_categories, :tag_images]
 
 def index
    @galleries = Gallery.all
  end

  def show
  end
  
  def new
    @gallery = Gallery.new
  end

  def edit
    
  end

  def all_photos
    @galleries = Gallery.all
    
  end

  def multiple_categories
    @categories = Category.all
  end

  def tag_images
    @gallery.category_ids = params[:gallery][:category_ids] rescue []
    if @gallery.save
      redirect_to @gallery, notice: "Tag the image."
    else
      redirect_to multiple_categories_gallery_path(@gallery), alert: "Error."
    end  
  end

  def create
    @gallery = Gallery.new(gallery_params) 
    if @gallery.save
      if params[:gallery][:image].present?
        render :crop
      else
        redirect_to @gallery, notice: "Successfully created user."
      end
      else
        render :new
    end
  end

  def update
    @gallery = Gallery.find(params[:id])
    if @gallery.update(gallery_params)
      if params[:gallery][:image].present?
        render :crop
      else
        redirect_to @gallery, notice: "Successfully updated gallery."
      end
    else
      render :new
    end
  end

  def destroy
    @gallery = Gallery.find(params[:id])
    @gallery.destroy
    redirect_to galleries_url, notice: "Successfully destroyed gallery."
  end

  private
  
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      params.require(:gallery).permit(:name, :caption, :description, :image, category_ids: [])
    end
end

