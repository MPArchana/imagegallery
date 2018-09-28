class CreateGalleries < ActiveRecord::Migration
  def change
    create_table :galleries do |t|
      t.integer :category_id
      t.string :name
      t.string :caption
      t.text :description
      t.string :image

      t.timestamps null: false
    end
  end
end
