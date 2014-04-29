class UsersController < ApplicationController

  def index
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render(:new)
    end
  end

  def edit
  end

  def update
    @user = User.find(@current_user.id)
    @user.update(user_params)

    if @user.save
      redirect_to root_path
    else
      flash[:notice] = "User update was unsuccessful. Please try again!"
      render(:edit)
  end

  private
  def user_params
    params.require(:user).permit(:name, :email, :password, :password_confirmation)
  end

end
