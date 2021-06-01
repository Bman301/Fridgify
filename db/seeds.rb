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

puts 'creating new ingredients'

10.times do
  Ingredient.create!(
    name: Faker::Food.ingredient
  )
end

puts 'creating new recipes'

10.times do
  r = Recipe.create!(
    comment: Faker::Lorem.paragraph,
    image: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80',
    title: Faker::Food.dish,
    prep_time: '30 min',
    description: Faker::Food.description,
    serving_size: '2 servings',
    rating: 4.5,
    difficulty_level: 'hard'
  )
  2.times do 
    RecipeIngredient.create!(
      amount: "1",
      recipe: r,
      ingredient: Ingredient.all.sample
    )
  end
end

puts 'done'