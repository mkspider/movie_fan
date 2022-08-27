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
    if @movie.save
      redirect_to admins_movies_path(@movie)
      flash[:notice] = '作品を登録しました！'
    else
      render:new
    end
  end

  def edit
    @movie = Movie.find(params[:id])
    @tag_list=@movie.tags.pluck(:tag_name).join(',')
  end

  def update
    @movie = Movie.find(params[:id])
    tag_list=params[:movie][:tag_name].split(',')
    if @movie.update(movie_params)
       @movie.save_tag(tag_list)
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
    params.require(:movie).permit(:filmname,:genre_id,:introduction,:image)
  end

end
