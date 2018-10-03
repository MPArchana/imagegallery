class RemoveCategoryIdFromGallery < ActiveRecord::Migration
  def change
    remove_column :galleries, :category_id, :integer
  end
end
