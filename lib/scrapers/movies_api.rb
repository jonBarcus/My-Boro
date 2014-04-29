require 'rubygems'
require 'nokogiri'
require 'open-uri'

module Movies_api

  @base_uri = "http://www.google.com/movies?"

  def self.convert_location(arg1, arg2, arg3, arg4)
      latitude = arg1
      longitude = arg2
      zip = arg3
      boro = arg4
      # return @location = latitude.to_s + "%2C" + longitude.to_s
      # return @location = zip
      return @location = boro + "%2CNY"
  end

  def self.build_request(time, date)
    movie_time = time
    movie_date = date
    search = "near=" + @location.to_s + "&mid=&hl=en&date=" + movie_date.to_s + "&view=list&time=" + movie_time.to_s
    test_uri = @base_uri + search
    return request = Nokogiri::HTML(open(test_uri))
  end

  def self.closest_movies(user_time, user_date)
    time=user_time
    date=user_date
    request = build_request(time, date)

    @local_movies = []

    theaters = request.css(".desc")
    movie_info = []
    theater_hash = {}
    movie_hash = {}

    theaters.each do |theater|

    theater_hash[:id] = "#" + theater.attributes["id"].value
    theater_hash[:name] = theater.css("h2").text
    theater_hash[:address] = theater.css(".info").text


      request.css(theater_hash[:id]).each do |node|
        node.next_sibling.css(".name").each do |movie|
          movie_hash[:name] = movie.text
          movie_info << movie_hash[:name].dup
        end
        counter = 1
        node.next_sibling.css(".times").each do |movie|
          movie_hash[:times] = movie.text.gsub(/[a-zA-Z\&\s\z]/, " ").split(" ")
          movie_info.insert(counter, movie_hash[:times].dup)
          counter += 2
        end
      end

      theater_hash[:movies] = movie_info.dup
      movie_info = []
      @local_movies << theater_hash.dup

    end

      return @local_movies

  end

  def self.display_a_sampler(number)
        my_theater = @local_movies[number]
        theater = my_theater[:name]
        address = my_theater[:address]
        movie1 = my_theater[:movies][0]
        movie_time1 = my_theater[:movies][1]
        if (movie2 = my_theater[:movies][2])
          movie_time2 = my_theater[:movies][3]
        else
          movie2 = ""
          movie_time2 = []
        end

        return movie_array = [theater, address, [movie1, movie_time1], [movie2, movie_time2] ]
  end

  def self.top_nine_movies(user_time, user_date)
    time = user_time
    date = user_date
    self.closest_movies(time, date)
    my_movies = {
          :movies1 => self.display_a_sampler(0),
          :movies2 => self.display_a_sampler(1),
          :movies3 => self.display_a_sampler(3)
      }
      return my_movies


  end

end
