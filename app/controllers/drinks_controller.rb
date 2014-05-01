require 'scrapers/nightlife_api'

class DrinksController < ApplicationController
  def show
    bars = NightlifeAPI.new(params[:location])
    # restaurants is returning an array of the top 10 results.
    response = {
      names: bars.names,
      addresses: bars.addresses,
      ratings: bars.ratings
    }

    render :json => { names: response[:names],
                      addresses: response[:addresses],
                      ratings: response[:ratings]
                    }

  end
end
