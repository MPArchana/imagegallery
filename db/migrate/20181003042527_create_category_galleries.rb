class CreateCategoryGalleries < ActiveRecord::Migration
  def change
    create_table :category_galleries do |t|
      t.references :category
      t.references :gallery
    end
  end
end
