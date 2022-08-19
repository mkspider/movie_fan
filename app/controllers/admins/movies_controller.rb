class Admins::MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def index
    @genres = Genre.all
    @movies = Movie.all.page(params[:page]).per(10)
  end

  def show
    @movie = Movie.find(params[:id])
    @review = Review.new
  end

  def create
    @movie = Movie.new(movie_params)
    @genres = Genre.all
    @movie.save!
      # save出来ない問題
      redirect_to admins_movies_path(@movie)
      flash[:notice] = '作品を登録しました！'

  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def update
    @movie = Movie.find(params[:id])
     if @movie.update(movie_params)
      redirect_to admins_movie_path(@movie.id)
      flash[:notice] = '作品情報を編集しました'
    else
      render :"show"
    end
  end

  def destroy
      @movie = Movie.find(params[:id])
      p @movie
      @movie.destroy
      redirect_to admins_movies_path(@movie)
  end

private
def movie_params
   params.require(:movie).permit(:filmname,:genre_id,:introduction)
end
end
