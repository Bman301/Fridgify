class Recipe < ApplicationRecord

  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients
  has_many :cookbooks

  validates :title, uniqueness: true

  accepts_nested_attributes_for :ingredients, reject_if: :all_blank, allow_destroy: true

  def self.by_ingredient(ingredient_name)
    Recipe.joins(recipe_ingredients: :ingredient).where( 'ingredients.name ILIKE ?', "%#{ingredient_name}%").order("rating DESC")
  end

end
