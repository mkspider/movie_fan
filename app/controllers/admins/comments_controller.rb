class Admins::CommentsController < ApplicationController
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

  def destroy
    @comment = Comment.find(params[:id])
    @review = @comment.review.movie_id
    @comment.destroy
    redirect_to admins_movie_review_comments_path
  end
end
