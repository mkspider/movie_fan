class Admins::UsersController < ApplicationController
  #before_action :admins_user, only: :destroy
  def index
    @users = User.all.page(params[:page]).per(10)
  end

 def show
    @user = User.find(params[:id])
 end

  def destroy
    @user = User.find(params[:id])
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to admins_users_path
  end

 private
  def user_params
     params.require(:user).permit(:name,:age,:gender,:image)
  end
end
