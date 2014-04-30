require 'scrapers/restaurant_api'

class RestaurantsController < ApplicationController
  def show
    restaurants = RestaurantsAPI.new(params[:location])
    # restaurants is returning an array of the top 10 results.
    response = {
      names: restaurants.names,
      addresses: restaurants.addresses,
      ratings: restaurants.ratings
    }

    render :json => { names: response[:names],
                      addresses: response[:addresses],
                      ratings: response[:ratings]
                    }

  end
end
