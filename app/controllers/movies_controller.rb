require 'scrapers/movies_api'

class MoviesController < ApplicationController

  def show
    movies = MoviesAPI.new(params[:location])
    response = {
      current_theaters: movies.theater_names,
      current_addresses: movies.theater_addresses,
      current_movies: movies.movie_titles,
      current_movies_times: movies.movie_times

    }
    render :json => { currentTheaters: response[:current_theaters],
      currentAddresses: response[:current_addresses],
      currentMovies: response[:current_movies],
      currentMoviesTimes: response[:current_movies_times]
        }
  end

end
