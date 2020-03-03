class UsersController < ApplicationController

  def show
    @user = User.find(params[:id])
  end

  private

  def user_params
    params.require(:user).require(:email)
  end
end
