class Users::MoviesController < ApplicationController
  def index
    @genres = Genre.all
    # p Movie.all
    @movies = Movie.all.page(params[:page]).per(10)
  end

  def show
    @genres = Genre.all
    @movie = Movie.find(params[:id])
    @review = Review.all
  end

  private
  def movie_params
    params.require(:movie).permit(:filmname,:introduction,:image)
  end
end
