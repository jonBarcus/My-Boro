require 'scrapers/news_api'

class WireController < ApplicationController

  def show
    binding.pry
    news = NewsAPI.new(params[:location])
    response = {
      current_headlines: news.get_headlines,
      current_urls: news.get_urls
    }
    render :json => { currentHeadlines: response[:current_headlines],
          currentUrls: response[:current_urls]
                          }
  end

end
