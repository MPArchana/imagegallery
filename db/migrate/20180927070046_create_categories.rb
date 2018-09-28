class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
      t.string :name
      t.string :code
      t.text :description
  

      t.timestamps null: false
    end
  end
end
