require 'scrapers/movies_api'

class MoviesController < ApplicationController

  def show
    movies = MoviesAPI.new(params[:location])
    response = {
      current_theaters:           movies.theater_names,
      current_addresses:        movies.theater_addresses,
      current_movies:            movies.movie_titles,
      current_movies_times:  movies.movie_times
    }

    render :json => { currentTheaters:      response[:current_theaters],
                               currentAddresses:    response[:current_addresses],
                               currentMovies:         response[:current_movies],
                               currentMoviesTimes: response[:current_movies_times]
        }

  end

  def favorites
    if  user = User.find(current_user.id)
      myMovies =  Movie.new(theater: params[:theater],
                                            address:         params[:address],
                                            title:    params[:title])
      if myMovies.save
        user.movies << myMovies
        render json: { msg: "saved movie" }
      else
        render json: { msg: "Your movie item did not get saved" }
      end

  else
      render :json => { message: "Something went wrong. Please login in try adding your favorite item again."}
  end
end

end
