class UsersController < ApplicationController

  def index
  end

  def create
    user = User.new(user_params)
      if user.save
        render :json => { message: "Sign up successful!", name: user.name }
      else
        render :json => { error: "sucksss"}
      end
  end

  private
  def user_params
    params.require(:user).permit(
      :name,
      :email,
      :password,
      :password_confirmation
    )
  end

end
