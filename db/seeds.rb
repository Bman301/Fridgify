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
  all_recipe_arr = recipe_hash['recipes']

  all_recipe_arr.each do |recipe|

    puts 'creating new recipes'
    recipes = Recipe.find_by(title: recipe["title"])
    unless recipes
      recipes = Recipe.create!(
        image: recipe["image"],
        title: recipe["title"],
        prep_time: recipe["readyInMinutes"].to_s,
        description: recipe["summary"],
        serving_size: recipe["servings"].to_s,
        rating: recipe["spoonacularScore"].to_i,
        difficulty_level: recipe["readyInMinutes"].to_s,
        steps: recipe["instructions"]
      )
    end

    puts 'creating new ingredients'

    recipe["extendedIngredients"].each do |ingredient|
      ingredients = Ingredient.find_by(name: ingredient["name"])
      unless ingredients
        ingredients = Ingredient.create!(
          name: ingredient["name"],
          api_response: ingredient["id"]
        )
      end
      RecipeIngredient.create!(
        amount: ingredient['original'],
        recipe: recipes,
        ingredient: ingredients
      )
    end
  end
end
puts 'done'
