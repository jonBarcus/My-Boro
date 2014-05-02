require 'scrapers/news_api'

class NewsController < ApplicationController

  def show
    news = NewsAPI.new(params[:location])
    response = {
      current_headlines: news.get_headlines,
      current_urls: news.get_urls
    }

    render :json => { currentHeadlines: response[:current_headlines],
          currentUrls: response[:current_urls]
     }

  end


  def favorites
      user = User.find(:id)

      myNews =  NewsItem.new(headline: params[:headline], url: params[:url])


      if myNews.save
        user.news_items << myNews
        render json: { msg: "saved user" }
      else
        render json: { msg: "Your news item did not get saved" }
      end

  end


end

