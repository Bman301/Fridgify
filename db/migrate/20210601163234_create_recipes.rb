class CreateRecipes < ActiveRecord::Migration[6.0]
  def change
    create_table :recipes do |t|
      t.text :comment
      t.string :image
      t.string :title
      t.string :prep_time
      t.text :description
      t.string :serving_size
      t.float :rating
      t.string :difficulty_level

      t.timestamps
    end
  end
end
