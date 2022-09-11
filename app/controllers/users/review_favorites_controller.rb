class  Users::ReviewFavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :review_params, only: [:create, :destroy]

  def create
    ReviewFavorite.create!(user_id: current_user.id, review_id: @review.id)
  end

  def destroy
    review_favorite = ReviewFavorite.find_by(user_id: current_user.id, review_id: @review.id)
    review_favorite.destroy
  end

  private
  def review_params
    @review = Review.find(params[:review_id])
    @movie = Movie.find(params[:movie_id])
  end

end
