class Admins::MoviesController < ApplicationController
  def new
    @movie = Movie.new
  end

  def index
    @genres = Genre.all
    @movies = Movie.all.page(params[:page]).per(10)
    @tag_list=Tag.all
  end

  def show
    @movie = Movie.find(params[:id])
    @review = Review.new
    @movie_tags = @movie.tags

  end

  def create
    @movie = Movie.new(movie_params)
    @genres = Genre.all
    tag_list=params[:movie][:name].split(',')
    if @movie.save
       @movie.save_tag(tag_list)
      redirect_to admins_movies_path(@movie)
      flash[:notice] = '作品を登録しました！'
    else
      render:new  
    end
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
      @movie.destroy
      redirect_to admins_movies_path(@movie)
  end

  private
  def movie_params
    params.require(:movie).permit(:filmname,:genre_id,:introduction,:image)
  end

end
