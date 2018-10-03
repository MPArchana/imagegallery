class CreateCategoriesGalleries < ActiveRecord::Migration
  def change
    create_table :categories_galleries do |t|
      t.references :category
      t.references :gallery

    end
  end
end
