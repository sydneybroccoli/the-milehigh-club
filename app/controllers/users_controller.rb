class UsersController < ApplicationController

  def show
    @user = current_user
    @aircraft = Aircraft.new
  end

  private

  def user_params
    params.require(:user).permit(:email)
  end
end
