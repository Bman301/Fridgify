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

# 10.times do
#   Ingredient.create!(
#     name: Faker::Food.ingredient
#   )
# end

all_ingredients = ["beans", "rice", "avocado", "tortillas", "cilantro", "cheese", "corn"]

all_ingredients.each do |ingredient|
  Ingredient.create!(
    name: ingredient
  )
end  

puts 'creating new recipes'

# 10.times do
#   r = Recipe.create!(
#     comment: Faker::Lorem.paragraph,
#     image: 'https://images.unsplash.com/photo-1504674900247-0877df9cc836?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80',
#     title: Faker::Food.dish,
#     prep_time: '30 min',
#     description: Faker::Food.description,
#     serving_size: '2 servings',
#     rating: 4.5,
#     difficulty_level: 'hard'
#   )
#   2.times do 
#     RecipeIngredient.create!(
#       amount: "1",
#       recipe: r,
#       ingredient: Ingredient.all.sample
#     )
#   end
# end

puts 'done'


recipe1 = Recipe.create!(
  # comment: ,
  image: "https://spoonacular.com/recipeImages/651715-556x370.jpg",
  title: 'Mexican Three Cheese Dip',
  prep_time: '45 mins',
  description: "Mexican Three Cheese Dip might be a good recipe to expand your hor d'oeuvre recipe box. It is a rather inexpensive recipe for fans of Mexican food. It is perfect for The Super Bowl.",
  serving_size: '12 servings',
  rating: 2.5,
  difficulty_level: 'Easy'
)

  RecipeIngredient.create!(
    amount: "1",
    recipe: recipe1,
    ingredient: Ingredient.all.sample
  )

recipe2 = Recipe.create!(
  # comment: ,
  image: "https://spoonacular.com/recipeImages/642395-556x370.jpg",
  title: "Enchilada Stuffed Spaghetti Squash",
  prep_time: '60 min',
  description: "The recipe Enchilada Stuffed Spaghetti Squash could satisfy your Mexican craving. This main course has 693 calories. A mixture of avocados, corn, beans, and a handful of other ingredients are all it takes to make this recipe so flavorful.",
  serving_size: '4 servings',
  rating: 4,
  difficulty_level: 'Medium'
)

  RecipeIngredient.create!(
    amount: "1",
    recipe: recipe2,
    ingredient: Ingredient.all.sample
  )

recipe3 = Recipe.create!(
  # comment: ,
  image: "https://spoonacular.com/recipeImages/732255-556x370.jpg",
  title: "Cheesy Cowboy Quesadillas",
  prep_time: '10 min',
  description: "Cheesy Cowboy Quesadillas takes about 10 minutes from beginning to end. One serving contains 505 calories. This recipe serves 4. It works well as a Mexican hor d'oeuvre. It is a good option if you're following a gluten free diet.",
  serving_size: '4 servings',
  rating: 2.5,
  difficulty_level: 'Easy'
)

  RecipeIngredient.create!(
    amount: "1",
    recipe: recipe3,
    ingredient: Ingredient.all.sample
  )

recipe4 = Recipe.create!(
  # comment: ,
  image: "https://spoonacular.com/recipeImages/715421-556x370.jpg",
  title: "Cheesy Chicken Enchilada Quinoa Casserole",
  prep_time: '15 mins',
  description: "Cheesy Chicken Enchilada Quinoa Casserole might be just the main course you are searching for. One serving contains <b>594 calories. Autumn will be even more special with this recipe. From preparation to the plate, this recipe takes about 30 minutes.",
  serving_size: '3 servings',
  rating: 4.9,
  difficulty_level:'Medium'
)

  RecipeIngredient.create!(
    amount: "1",
    recipe: recipe4,
    ingredient: Ingredient.all.sample
  )

recipe5 = Recipe.create!(
  # comment: ,
  image: "https://spoonacular.com/recipeImages/646427-556x370.jpg",
  title: "Healthy & Spicy Fish Taco Salad",
  prep_time: '45 mins',
  description: "Healthy & Spicy Fish Taco Salad might be just the Mexican recipe you are searching for. This recipe makes 4 servings with 586 calories. A mixture of juice of lime, vegetable oil, cherry tomatoes, and a handful of other ingredients are all it takes to make this recipe so yummy.",
  serving_size: '5 servings',
  rating: 4.5,
  difficulty_level: 'Hard'
)

  RecipeIngredient.create!(
    amount: "1",
    recipe: recipe5,
    ingredient: Ingredient.all.sample
  )

recipe6 = Recipe.create!(
  # comment: ,
  image: "https://spoonacular.com/recipeImages/641815-556x370.jpg",
  title: "Easy and Delicious Taco Soup",
  prep_time: '35 mins',
  description: "The recipe Easy and Delicious Taco Soup is ready in about about 45 minutes and is definitely a super gluten free option for lovers of Mexican food. One serving contains 369 calories. This recipe serves 6 and costs $2.49 per serving. A mixture of cheese, cilantro, kidney beans, and a handful of other ingredients are all it takes to make this recipe so delicious. It works well as a main course. It will be a hit at your Autumn event.",
  serving_size: '6 servings',
  rating: 3.8,
  difficulty_level: 'Medium'
)

  RecipeIngredient.create!(
    amount: "1",
    recipe: recipe6,
    ingredient: Ingredient.all.sample
  )

recipe7 = Recipe.create!(
  # comment: ,
  image: "https://spoonacular.com/recipeImages/652330-556x370.jpg",
  title: "Mommie's Seafood Enchiladas",
  prep_time: '50 mins',
  description: "The recipe Mommie's Seafood Enchiladas is ready in approximately 45 minutes and is definitely a great gluten free and pescatarian option for lovers of Mexican food. This main course has 460 calories. If you have salt, butter, tortillas, and a few other ingredients on hand, you can make it.",
  serving_size: '8 servings',
  rating: 2.8,
  difficulty_level: 'Hard'
)

  RecipeIngredient.create!(
    amount: "1",
    recipe: recipe7,
    ingredient: Ingredient.all.sample
  )

recipe8 = Recipe.create!(
  # comment: ,
  image: "https://spoonacular.com/recipeImages/648875-556x370.jpg",
  title: "Kickin’ Vegan Quesadillas",
  prep_time: '40 mins',
  description: "Kickin’ Vegan Quesadillas might be a good recipe to expand your hor d'oeuvre recipe box. This recipe serves 8 and costs 49 cents per serving. Watching your figure? This gluten free and lacto ovo vegetarian recipe has 178 calories. If you have cheddar flavor, vegetarian refried beans, salsa, and a few other ingredients on hand, you can make it. From preparation to the plate, this recipe takes around around 45 minutes. This recipe is typical of Mexican cuisine.",
  serving_size: '8 servings',
  rating: 3.5,
  difficulty_level: 'Medium'
)

  RecipeIngredient.create!(
    amount: "1",
    recipe: recipe8,
    ingredient: Ingredient.all.sample
  )

recipe9 = Recipe.create!(
  # comment: ,
  image: "https://spoonacular.com/recipeImages/633119-556x370.jpg",
  title: "Avocado & Tomato Salad Topped with Grilled Shrimp",
  prep_time: '45 min',
  description: "Avocado & Tomato Salad Topped with Grilled Shrimp might be just the main course you are searching for. This recipe serves 2 and costs $9.75 per serving. One serving contains 555 calories. It is a good option if you're following a gluten free, dairy free, and pescatarian diet. If you have plum tomatoes, limes, garlic powder, and a few other ingredients on hand, you can make it. The Fourth Of July will be even more special with this recipe. From preparation to the plate, this recipe takes roughly 45 minutes.",
  serving_size: '2 servings',
  rating: 5,
  difficulty_level: '45 min'
)

  RecipeIngredient.create!(
    amount: "1",
    recipe: recipe9,
    ingredient: Ingredient.all.sample
  )