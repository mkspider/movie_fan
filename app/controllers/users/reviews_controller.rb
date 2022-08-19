class Users::ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def index
    @reviews = Review.all.page(params[:page]).per(4)
    @movie =Movie.all
  end

  def show
    @review = Review.find(params[:id])
    @comment = Comment.new
  end

  def create
    movie = Movie.find(params[:movie_id])
    review = current_users.reviews.new(review_params)
    review.movie_id = movie.id
    review.save
    redirect_to users_review_path(@review)
  end

  def edit
    @review = Review.find(params[:id])
  end

  def destroy
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to users_review_path(@review)
  end

  def update
    @review = Review.find(params[:id])
    if @review.update(review_params)
      redirect_to users_review_path(@review)
    else
      render "edit"
    end
  end

  private
  def review_params
    params.require(:review).permit(:title,:review,:image)
  end
end
