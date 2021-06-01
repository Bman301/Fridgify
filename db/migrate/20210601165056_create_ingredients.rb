class CreateIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :ingredients do |t|
      t.string :name
      t.string :api_response
      t.references :recipe_ingredients, null: false, foreign_key: true

      t.timestamps
    end
  end
end
