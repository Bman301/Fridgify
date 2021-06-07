require 'json'
require 'open-uri'
class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show]
  skip_before_action :authenticate_user!, only: [ :index, :show ]

  def index

    user_ingredients = params[:query].split(" ")
    @recipes = []
    user_ingredients.each do |ingredient|
      @recipes << Recipe.by_ingredient(ingredient)
    end

    @recipes = @recipes.flatten - [nil]

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
    api_key = "d0b142a570734c37a523f144e830fcae"
    @recipes = [];

    url = "https://api.spoonacular.com/recipes/findByIngredients?ingredients=#{params[:query]}&number=5&apiKey=#{api_key}"
    five_recipes = URI.open(url).read
    @recipes_ingredients = JSON.parse(five_recipes)

    @recipes_ingredients.each do |recipe|
      url = "https://api.spoonacular.com/recipes/#{recipe["id"]}/information?includeNutrition=false&apiKey=#{api_key}"
      one_recipe = URI.open(url).read
      parsed_recipe = JSON.parse(one_recipe)

      @recipes.push(parsed_recipe)
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
