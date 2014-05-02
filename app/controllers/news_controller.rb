require 'scrapers/news_api'

class NewsController < ApplicationController

  def show
    news = NewsAPI.new(params[:location])

    response = {
      current_headlines: news.get_headlines,
      current_urls:          news.get_urls
    }

    render :json => { currentHeadlines:  response[:current_headlines],
                                currentUrls:          response[:current_urls]
                              }
  end

  def favorites
   if   user = User.find(current_user.id)
      myNews =  NewsItem.new(headline: params[:headline],
                                               url:          params[:url])
      if myNews.save
        user.news_items << myNews
        render json: { msg: "saved news item" }
      else
        render json: { msg: "Your news item did not get saved" }
      end

  else
      render :json => { message: "Something went wrong. Please login in try adding your favorite item again."}
  end
end

end

