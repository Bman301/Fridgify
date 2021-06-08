class CookbooksController < ApplicationController

  def index
    if current_user
    @cookbooks = Cookbook.where(user: current_user)
    else
    @cookbooks = []  
    end
  end


  def create

    @cookbook = Cookbook.find_by(recipe_id: params[:recipe_id], user_id: current_user.id)
    if @cookbook 
    
      @cookbook.destroy
      render json: {}
    
    else
      
        @cookbook = Cookbook.new
        @user = current_user
        @recipe = Recipe.find(params[:recipe_id])

        @cookbook.recipe = @recipe
        @cookbook.user = @user

        @cookbook.save
          render json: @cookbook
    end
  end


end
