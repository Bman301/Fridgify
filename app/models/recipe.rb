class Recipe < ApplicationRecord

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  def self.by_ingredient(ingredient_name)
    # 1. Search for ingredients that match name
    ingredient = Ingredient.find_by('name ILIKE ?', ingredient_name)
    return nil unless ingredient
    # 2. Search for recipe_ingredients containing ingredient
    recipe_ingredients = RecipeIngredient.where(ingredient: ingredient)
    recipe_ingredients_ids = recipe_ingredients.pluck(:id)
    # 3. Return all recipes
    Recipe.where(id: recipe_ingredients_ids)
  end


end
