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


Dir.each_child("./data") do |file|
  json = File.open("./data/#{file}").read
  recipe_hash = JSON.parse(json)
  
  puts 'creating new recipes'

  recipe = Recipe.create!(
    image: recipe_hash["image"],
    title: recipe_hash["title"],
    prep_time: recipe_hash["readyInMinutes"].to_s,
    description: recipe_hash["summary"],
    serving_size: recipe_hash["servings"].to_s,
    rating: recipe_hash["spoonacularScore"].to_i,
    difficulty_level: recipe_hash["readyInMinutes"].to_s
  )


  puts 'creating new ingredients'

  recipe_hash["extendedIngredients"].each do |ingredient|
    ingredients = Ingredient.create!(
      name: ingredient["name"],
      api_response: ingredient["id"]
    )
    RecipeIngredient.create!(
      amount: '1',
      recipe: recipe,
      ingredient: ingredients
    )
  end  
end

puts 'done'

