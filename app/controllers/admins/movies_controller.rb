class Admins::MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def index
    @genres = Genre.all
    @movies = Movie.all.page(params[:page]).per(10)
  end

  def show
  end

  def create
    @movie = Movie.new(movie_params)
    @genres = Genre.all
    if @movie.save 
      # save出来ない問題
      redirect_to admins_movies_path(@movie)
      flash[:notice] = '作品を登録しました！'
    else
    render "new"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

private
def movie_params
   params.require(:movie).permit(:filmname,:genre_id,:introduction) 
end   
end
