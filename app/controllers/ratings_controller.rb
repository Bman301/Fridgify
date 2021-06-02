class RatingsController < ApplicationController

  def create
    @rating = Rating.new(rating_params)
    @user = current_user
    @recipe = Recipe.find(params[:recipe_id])

    @rating.recipe = @recipe
    @rating.user = @user

    if  @rating.save
      redirect_to recipe_path(@recipe)
    else
      render "recipes/show"
    end

  end

  private

  def rating_params
    params.require(:rating).permit(:rating)
  end
end
