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


  def favorites
      user = User.find(current_user.id)

      myDrinks =  Drink.new(headline: params[:name], url: params[:address], rating: params[:rating])


      if myDrinks.save
        user.drinks << myDrinks
        render json: { msg: "saved drink" }
      else
        render json: { msg: "Your drink item did not get saved" }
      end

  end





end
