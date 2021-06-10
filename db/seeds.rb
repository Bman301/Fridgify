require 'faker'

puts 'deleting db'

User.destroy_all
RecipeIngredient.destroy_all
Recipe.destroy_all
Ingredient.destroy_all

puts 'creating new users'

10.times do
  User.create!(
    username: Faker::Internet.username,
    email: Faker::Internet.email,
    password: 123456
  )
end


# {
#   'recipes': [
#     {
#       title: lala,
#       type: dinner
#     },
#     {
#       title: cheese sticks
#       type: very cheesy
#     }
#   ]
# }


Dir.each_child("./data") do |file|

  json = File.open("./data/#{file}").read
  recipe_hash = JSON.parse(json)
  all_recipes = recipe_hash['recipes']

  all_recipes.each do |recipe|

    puts 'creating new recipes'
    existing_recipe = Recipe.find_by(title: recipe["title"])
    unless existing_recipe
      existing_recipe = Recipe.create!(
        image: recipe["image"],
        title: recipe["title"],
        prep_time: recipe["readyInMinutes"].to_s,
        description: recipe["summary"],
        serving_size: recipe["servings"].to_s,
        rating: recipe["spoonacularScore"].to_f / 20,
        difficulty_level: recipe["readyInMinutes"].to_s,
        steps: recipe["instructions"]
      )
    end

    puts 'creating new ingredients'


    recipe["extendedIngredients"].each do |ingredient|
      existing_ingredient = Ingredient.find_by(name: ingredient["name"])
      unless existing_ingredient
        existing_ingredient = Ingredient.create!(
          name: ingredient["name"],
          api_response: ingredient["id"]
        )
      end
      recipe_ingredient = RecipeIngredient.find_by(recipe: existing_recipe, ingredient: existing_ingredient)
      unless recipe_ingredient
        RecipeIngredient.create!(
          amount: ingredient['original'],
          recipe: existing_recipe,
          ingredient: existing_ingredient
        )
      end
    end
  end
end
puts 'done'
