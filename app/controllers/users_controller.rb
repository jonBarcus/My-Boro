class UsersController < ApplicationController

  def index
    weather = Weather.new("Brooklyn")
    response = {
      current_temp: weather.current_temp,
      current_weather: weather.current_weather,
      current_wind: weather.wind,
      current_humidity: weather.humidity
    }

    render :json => response
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
