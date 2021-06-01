class RemoveRecipeReferenceToIngredients < ActiveRecord::Migration[6.0]
  def change
    remove_reference :ingredients, :recipe_ingredients, index: true, foreign_key: true 
  end
end
