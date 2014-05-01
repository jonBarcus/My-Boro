require 'scrapers/location_api'

class SessionController < ApplicationController
  def index
    current_user_region = LocationAPI.region
    current_user_zipcode = LocationAPI.zipcode

    render :json => { current_user_region: current_user_region, current_user_zipcode: current_user_zipcode }
  end

  def create
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        session[:user_zip] = Location.zip
        session[:user_region] = Location.region
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
