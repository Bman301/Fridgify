class RecipesController < ApplicationController
  before_action :find_recipe, only: [:show]

  def index
    @recipes = Recipe.all
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

  private
#  we need to check the image field later
  def recipe_params
     params.require(:recipe).permit(:comment, :image, :title, :prep_time, :description, :serving_size, :rating, :difficulty_level)
  end

  def find_recipe
    @recipe = Recipe.find(params[:id])
  end

end
