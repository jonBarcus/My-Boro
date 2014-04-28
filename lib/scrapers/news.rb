class News

  def initialize(location)

    news_key = ENV['NYT_ARTICLE_SEARCH_KEY']

    @news_instance = HTTParty.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=#{location}&fq=news_desk:Metro&page=1&sort=newest&api-key=#{news_key}")

  end

  def get_headline

    headline_array = []
    top_five = 1

    while top_five <= 5

      headline_array << @news_instance["headline"]["main"]

    end

    # news_headline = @news_instance["headline"]["main"]
    return headline_array


  end

  def get_url

    @news_instance["web_url"]
  end


end
