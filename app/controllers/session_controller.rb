require 'scrapers/location_api'

class SessionController < ApplicationController
  def index
    current_user_city = LocationAPI.city
    current_user_zipcode = LocationAPI.zipcode
    # current_user_lat = LocationAPI.lat
    # current_user_lon= LocationAPI.lon

    render :json => { current_user_city: current_user_city,
      current_user_zipcode: current_user_zipcode,
      # current_user_lat: current_user_lat,
      # current_user_lon: current_user_lon
    }
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        render :json => { message: "Hello, #{user.name}!"}
    else
      render :json => { message: "Login unsuccessful. Please try again."}
    end
  end

  def destroy
    @current_user = session[:user_id] = nil
    render :json => { message: "Goodbye! See you again soon." }
  end


end
