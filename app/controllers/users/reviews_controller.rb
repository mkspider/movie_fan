class Users::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

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

  def create
    movie = Movie.find(params[:movie_id])
    review = Review.new(review_params)
    review.movie_id = movie.id
    review.user_id = current_user.id
    review.save
    redirect_to users_movie_reviews_path
  end

  def edit
    @review = Review.find(params[:id])
    @movie =@review.movie_id
  end

  def destroy
    @review = Review.find(params[:id])
    @movie =@review.movie_id
    @review.destroy
    redirect_to users_movie_reviews_path(@movie)
  end

  def update
    @review = Review.find(params[:id])
    @movie =@review.movie_id
    if @review.update(review_params)
      redirect_to users_movie_reviews_path
    else
      render "edit"
    end
  end

  private
  def review_params
    params.require(:review).permit(:title,:review,:image)
  end
end
