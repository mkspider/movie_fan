class Users::GenresController < ApplicationController
  def index
    @genres = Genre.all
    @movies = Movie.all.page(params[:page]).per(10)
  end

  def show
    @genres = Genre.all
     if params[:id]
    @movies = Movie.where(genre_id: params[:id]).page(params[:page]).per(10)
     else
    @movies = Movie.all.page(params[:page]).per(10)
     end
  end

  def search_movie
    @movie=Movie.new
    @movies = Movie.search(params[:keyword])
  end

  def create
  end

  def edit
  end

  def update
  end
end
