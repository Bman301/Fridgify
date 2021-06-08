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
      flash[:notice] = 'Saved!'
      redirect_back(fallback_location: recipes_path, anchor: "hola")
    else
        flash[:notice] = 'Not saved, try again!'
        redirect_back(fallback_location: recipes_path)
    end

  end

   def destroy
    @cookbook = Cookbook.find(params[:id])
    @cookbook.destroy
    flash[:alert] = 'Deleted...'
    redirect_back(fallback_location: recipes_path)
   end

end
