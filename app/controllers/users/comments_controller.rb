class Users::CommentsController < ApplicationController
  def new
    @comment = Comment.new
    @movie = Movie.find(params[:movie_id])
    @review = Review.find(params[:review_id])
  end

  def index
    @comments = Comment.where(review_id: params[:review_id])
    @review =Review.find(params[:review_id])
    @users = User.all
    @movie = Movie.find(params[:movie_id])
  end


  def show
    @comment = Comment.find(params[:id])
    @review =Review.find(params[:review_id])
    @movie = Movie.find(params[:movie_id])
    @users = User.all
  end

  def create
    movie = Movie.find(params[:movie_id])
    review = Review.find(params[:review_id])
    comment = Comment.new(comment_params)
    comment.review_id = review.id
    comment.user_id = current_user.id
    comment.save
    redirect_to users_movie_review_comments_path
  end

  def edit
    @comment = Comment.find(params[:id])
    @review = @comment.review.movie_id
  end

  def destroy
    @comment = Comment.find(params[:id])
    @review = @comment.review.movie_id
    @comment.destroy
    redirect_to users_movie_review_comments_path
  end

  def update
    @comment = Comment.find(params[:id])
    @review = @comment.review.movie_id
    if @comment.update(comment_params)
      redirect_to users_movie_review_comments_path(@comment)
    else
      render "edit"
    end
  end


private
  def comment_params
    params.require(:comment).permit(:comment,:review_id)
  end
end
