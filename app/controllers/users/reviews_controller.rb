class Users::ReviewsController < ApplicationController
  def new
  end

  def index
  end

  def show
  end

  def create
    movie = Movie.find(params[:id])
    review = current_users.reviews.new(review_params)
    review.movie_id = movie.id
    review.save
    redirect_to users_movies_path(@movie)
  end

  def edit
  end

  def destroy
  end

  def update
  end
end
