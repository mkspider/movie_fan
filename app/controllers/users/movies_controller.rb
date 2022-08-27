class Users::MoviesController < ApplicationController
  def index
    @genres = Genre.all
    @movies = Movie.all.page(params[:page]).per(10)
    @tag_list=Tag.all
  end

  def show
    @genres = Genre.all
    @movie = Movie.find(params[:id])
    @review = Review.all
    @movie_tags = @movie.tags
  end

  def search_movie
    @movie=Movie.new
    @movies = Movie.search(params[:keyword])
  end

  def search_tag
    #検索結果画面でもタグ一覧表示
    @tag_list=Tag.all
    #検索されたタグを受け取る
    @tag=Tag.find(params[:tag_id])
    #検索されたタグに紐づく投稿を表示
    @movies=@tag.movies.page(params[:page]).per(10)
    @genres = Genre.all
    render :"index"
  end

  private
  def movie_params
    params.require(:movie).permit(:filmname,:introduction,:genre,:image)
  end
end
