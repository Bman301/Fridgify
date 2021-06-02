class Recipe < ApplicationRecord

  include PgSearch::Model
  has_many :recipe_ingredients
  has_many :ingredients, through: :recipe_ingredients

  pg_search_scope :global_search,
    associated_against: {
      ingredient: :name
    },
    using: {
      tsearch: { prefix: true }
    }


end
