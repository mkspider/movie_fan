class Users::MoviesController < ApplicationController
  def index
    @genres = Genre.all
    @movies = Movie.all.page(params[:page]).per(10)
  end

  def show
    @genres = Genre.all
    @movie = Movie.find(params[:id])
    @review = Review.all
  end
  
  def search_movie
    @movie=Movie.new
    @movies = Movie.search(params[:keyword])
  end

  private
  def movie_params
    params.require(:movie).permit(:filmname,:introduction,:gunre,:image)
  end
end
