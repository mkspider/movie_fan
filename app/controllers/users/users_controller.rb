class Users::UsersController < ApplicationController
  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = current_user
    if @user.update(user_params)
      redirect_to users_path
    else
      render "edit"
    end
  end

  private
  def user_params
    params.require(:user).permit(:name,:gender,:age,:email,:profile_image)
  end
end