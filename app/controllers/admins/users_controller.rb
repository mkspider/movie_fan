class Admins::UsersController < ApplicationController
  #before_action :admins_user, only: :destroy
  def index
    @users = User.all.page(params[:page]).per(10)
    @review_score = calc_average(Review.where(movie_id: params[:movie_id]))
  end

 def show
    @user = User.find(params[:id])
    byebug
    @review.score = Language.get_data(review_params[:review])
    
 end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to admins_users_path
  end

  def calc_average(reviews)
    return reviews.average(:score)
  end

 private
  def user_params
     params.require(:user).permit(:name,:age,:gender,:image)
  end
  
  # def review_params
  #   params.require(:review).permit(:review)
  # end
  
end
