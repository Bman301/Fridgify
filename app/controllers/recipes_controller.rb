require 'json'
require 'open-uri'
class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index

    user_ingredients = params[:query].split(" ")
    @user_ingredients = user_ingredients
    @recipes = []
    user_ingredients.each do |ingredient|
      @recipes << Recipe.by_ingredient(ingredient)
    end

    @recipes = @recipes.flatten - [nil]
    @recipes = @recipes.take(6)

  end

  def new
    @recipe = Recipe.new
  end

  def create
    @recipe = Recipe.new(recipe_params)
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  def show
    @rating = Rating.new
    @cookbook = Cookbook.new
  end

  def api_call
    api_key = "8125a13e97764742a7910c93056f7fed"
    recipes = [];
    @saved_recipes = [];

    url = "https://api.spoonacular.com/recipes/findByIngredients?ingredients=#{params[:query]}&number=5&apiKey=#{api_key}"
    five_recipes = URI.open(url).read
    recipes_ingredients = JSON.parse(five_recipes)

    recipes_ingredients.each do |recipe|
      url = "https://api.spoonacular.com/recipes/#{recipe["id"]}/information?includeNutrition=false&apiKey=#{api_key}"
      one_recipe = URI.open(url).read
      parsed_recipe = JSON.parse(one_recipe)

      recipes.push(parsed_recipe)
    end

    recipes.each do |recipe|
      existing_recipe = Recipe.find_by(title: recipe["title"])
      unless existing_recipe
        new_recipe = Recipe.create!(
          image: recipe["image"],
          title: recipe["title"],
          prep_time: recipe["readyInMinutes"].to_s,
          description: recipe["summary"],
          serving_size: recipe["servings"].to_s,
          rating: recipe["spoonacularScore"].to_i,
          difficulty_level: recipe["readyInMinutes"].to_s,
          steps: recipe["instructions"]
        )

        recipe["extendedIngredients"].each do |ingredient|
          existing_ingredient = Ingredient.find_by(name: ingredient["name"])
          unless existing_ingredient
          existing_ingredient = Ingredient.create!(
            name: ingredient["name"],
            api_response: ingredient["id"]
          )
          end

          if existing_ingredient
          RecipeIngredient.create!(
            amount: ingredient['original'],
            recipe: new_recipe,
            ingredient: existing_ingredient
          )
          end
        end

        @saved_recipes.push(new_recipe)
      end
    end

  end

  private

  def recipe_params
     params.require(:recipe).permit(:comment, :image, :title, :prep_time, :description, :serving_size, :rating, :difficulty_level)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

end
