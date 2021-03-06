class CreateRecipeIngredients < ActiveRecord::Migration[6.0]
  def change
    create_table :recipe_ingredients do |t|
      t.string :amount
      t.references :recipe, null: false, foreign_key: true

      t.timestamps
    end
  end
end
