class Users::CommentsController < ApplicationController
  def new
    @comment = Comment.new
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
    @users = User.all
  end

  def create
    review = Review.find(params[:review_id])
    comment = Comment.new(comment_params)
    comment.review_id = review.id
    comment.user_id = current_user.id
    comment.save
    redirect_to users_movie_review_comments_path

  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    redirect_to users_movie_review_comments_path
  end

  def update
    @comment = Comment.find(params[:id])
    if @comment.update(comment_params)
      redirect_to users_movie_review_comments_path
    else
      render "edit"
    end
  end


private
  def comment_params
    params.require(:comment).permit(:comment)
  end
end
