class UsersController < ApplicationController

  def show
    @user = current_user
<<<<<<< HEAD
  end

  def edit
    @user = current_user
  end

  def update
    edit
    @user.update(user_params)
    redirect_to user_path(@user)
=======
    @aircraft = Aircraft.new
>>>>>>> 67d894d8c0c6782563134c9ff2523321b6b0b319
  end

  private

  def user_params
<<<<<<< HEAD
    params.require(:user).permit(:email, :first_name, :last_name, :favorite, :content, :photo)

=======
    params.require(:user).permit(:email)
>>>>>>> 67d894d8c0c6782563134c9ff2523321b6b0b319
  end
end
