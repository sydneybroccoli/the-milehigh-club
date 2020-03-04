class UsersController < ApplicationController

  def show
    @user = current_user
  end

  def edit
    @user = current_user
  end

  def update
    @user = User.find(current_user.id)
    if @user.update(user_params)
      redirect_to user_path(@user)
    else
      render 'edit'
    end
    @aircraft = Aircraft.new
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :last_name, :favorite, :content, :photo)
  end
end
