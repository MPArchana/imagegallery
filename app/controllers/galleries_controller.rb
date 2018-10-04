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
     #render :crop
    respond_to do |format|
      if @gallery.save
        format.html { redirect_to @gallery, notice: 'Gallery was successfully created.' }
        format.json { render :show, status: :created, location: @gallery }
      else
        format.html { render :new }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @gallery.update(gallery_params)
         #render :crop
        format.html { redirect_to @gallery, notice: 'Gallery was successfully updated.' }
        format.json { render :show, status: :ok, location: @gallery }
      else
        format.html { render :edit }
        format.json { render json: @gallery.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @gallery.destroy
    respond_to do |format|
      format.html { redirect_to galleries_url, notice: 'Gallery was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  
    def set_gallery
      @gallery = Gallery.find(params[:id])
    end

    def gallery_params
      params.require(:gallery).permit(:name, :caption, :description, :image, category_ids: [])
    end
end

