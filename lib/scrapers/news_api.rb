class NewsAPI

  def initialize(location)

    # set local variable to the secret NYTimes API key
    news_key = ENV['NYT_ARTICLE_SEARCH_KEY']

    # putting the HTTParty GET request JSON response to a
    # variable @news_instance
    # the GET url will take the key and the location that
    # is passed in to the new instance
    # Documentation available here:
    # http://developer.nytimes.com/docs/read/article_search_api_v2#building-search
    @news_instance = HTTParty.get("http://api.nytimes.com/svc/search/v2/articlesearch.json?q=#{location}&fq=news_desk:Metro&page=1&sort=newest&api-key=#{news_key}")
  end


  # This function returns an array of the headlines for
  # the top 5 stories on the NYTimes meeting the search
  # parameter that is defined by the LOCATION that is
  # passed in to the object instantiation
  def get_headlines

    # this creates an empty array for the headlines to go
    headline_array = []
    # this is a counter for the while loop
    top_five = 0

    # this will loop through the stories that are returned
    # via the GET request and put them as strings in the
    # headline_array array
    while top_five < 5

      # this passes the headline from the JSON that was
      # returned in @news_instance in to the array
      # and then we increment the top_five counter
      headline_array << @news_instance["response"]["docs"][top_five]["headline"]["main"]
      top_five += 1
    end

    # returns the headline array
    return headline_array

  end

  # this method will return an array of strings that is
  # made up of the top five stories (from the above method)
  # URLs
  # it functions exactly the same as the get_headlines
  # method
  def get_urls

    url_array = []
    top_five = 0

    while top_five < 5
      url_array << @news_instance["response"]["docs"][top_five]["web_url"]
      top_five += 1
    end

    # returns the array
    return url_array

  end


end
