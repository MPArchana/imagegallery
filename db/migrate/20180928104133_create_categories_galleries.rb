class CreateCategoriesGalleries < ActiveRecord::Migration
  def change
    create_table :categories_galleries do |t|
      t.integer :category_id
      t.integer :gallery_id
    end
  end
end
