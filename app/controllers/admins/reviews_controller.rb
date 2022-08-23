class Admins::ReviewsController < ApplicationController
  def index
    @reviews = Review.where(movie_id: params[:movie_id]).page(params[:page]).per(4)
    @movie =Movie.find(params[:movie_id])
    @users = User.all
  end

  def show
    @review = Review.find(params[:id])
    @movie =Movie.find(params[:movie_id])
    @comment = Comment.new
    @users = User.all
  end

  def destroy
    @review = Review.find(params[:id])
    @movie =@review.movie_id
    @review.destroy
    redirect_to admins_movie_reviews_path(@movie)
  end

  private
  def review_params
    params.require(:review).permit(:title,:review,:image)
  end

end
