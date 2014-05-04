require 'scrapers/nightlife_api'

class DrinksController < ApplicationController

  def show


    if params[:arg2] == 0
      bars = NightlifeAPI.new(params[:arg1])
    else
      bars = NightlifeAPI.new(params[:arg1], params[:arg2])
    end


    # drinks api is returning an array of the top 10 zagat results.

    response = {
      names:       bars.names,
      addresses:  bars.addresses,
      ratings:      bars.ratings
    }


    render :json => { names:       response[:names],
                                addresses: response[:addresses],
                                ratings:      response[:ratings]
                              }

  end


  def favorites

    if  user = User.find(current_user.id)


      myDrinks =  Drink.new(headline: params[:name],
                                          url: params[:address],
                                          rating: params[:rating])
      if myDrinks.save
          user.drinks << myDrinks
          render json: { msg: "saved drink" }
      else
          render json: { msg: "Your drink item did not get saved" }
      end

  else
        render :json => { message: "Something went wrong. Please login in try adding your favorite item again."}
  end

end



end
