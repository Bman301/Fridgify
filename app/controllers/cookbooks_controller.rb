class CookbooksController < ApplicationController

  def index
    @cookbooks = Cookbook.all
  end

  def create
    @cookbook = Cookbook.new
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])

    @cookbook.recipe = @recipe
    @cookbook.user = @user

    if  @cookbook.save
      redirect_to recipe_path(@recipe)
    else
      render "recipes/show"
    end

  end

  # def destroy
  #   @cookbook = Cookbook.find()
  # end

end
