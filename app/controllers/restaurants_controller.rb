require 'scrapers/restaurant_api'

class RestaurantsController < ApplicationController

  def show


    if params[:arg2]==0
      restaurants = RestaurantsAPI.new(params[:arg1])
    else
      restaurants = RestaurantsAPI.new(params[:arg1], params[:arg2])
    end


    # restaurants is returning an array of the top 10 results.
    response = {
      names:        restaurants.names,
      addresses:   restaurants.addresses,
      ratings:       restaurants.ratings
    }



    render :json => {   names:        response[:names],
                                  addresses:  response[:addresses],
                                  ratings:       response[:ratings]
                              }
  end

  def favorites
    if user = User.find(current_user.id)
      myRestaurants =  Restaurant.new(headline:   params[:name],
                                                          url:            params[:address],
                                                          rating:       params[:rating])
      if myRestaurants.save
        user.restaurants << myRestaurants
        render json: { msg: "saved restaurant" }
      else
        render json: { msg: "Your restaurant item did not get saved" }
      end

  else
      render :json => { message: "Something went wrong. Please login in try adding your favorite item again."}
  end
  end

end
