class FavoritesController < ApplicationController
  before_action :authenticate_user!, only: [:create, :destroy]
  before_action :review_params, only: [:create, :destroy]
  before_action :comment_params, only: [:create, :destroy]

  def create
    Like.create(user_id: current_user.id, review_id: @review.id, comment_id: @comment.id)
  end

  def destroy
    like = Like.find_by(user_id: current_user.id, review_id: @review.id, comment_id: @comment.id)
    like.destroy
  end

  private
  def review_params
    @review = Review.find(params[:review_id])
  end

  def comment_params
    @comment = Comment.find(params[:comment_id])
  end

end
