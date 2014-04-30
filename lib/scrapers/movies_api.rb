# this class will do a search for Movies in/around
# a specified location.  The location can be given as
# a STRING: "Staten Island", a ZIP: 10017, or LATTITUDE/
# LONGITUDE:  40.741061, -73.989699
# It makes use of Nokogiri and open-uri
class MoviesAPI

  def initialize(*location)
    now = Time.now
    # The search requires a timeframe for what you would
    # like returned in the results
    # 1 = Morning, 2 = Early Afternoon, 3 = Evening
    # 4 = Latenight, 5 = All day
    # The following conditionals only look for options
    # 1-4
    if now.hour > 20 && now.min > 50
      time = 4
    elsif now.hour > 4 && now.min > 50
      time = 3
    elsif now.hour == 11 && now.min > 50
      time = 2
    else
      time = 1
    end

    # These conditionals check for what is passed in
    # to the instantiation of the object
    # If the location is one of the 5 matching strings
    # (the FOUR borughs of NYC and the wrongfully annexed
    # city of Brooklyn) it sets the location.  It then
    # tests to see if the first element of the array is
    # both an integer and 5 digits long (for a ZIP).  If
    # both those tests return false then it assumes that
    # latitude and longitude was passed and converts them
    # to strings, inserting the required "%20" and sets
    # the location variable to the correct value
    if location[0] == "Queens" || location[0] == "Staten Island" || location[0] == "Bronx" || location[0] == "Manhattan" || location[0] == "Brooklyn"
      location = location[0].gsub(" ", "%20")
    elsif location[0].is_a?(Integer) && location[0].to_s.split("").length == 5
      location = location[0]
    else
      latitude = location[0].to_s + "%2C"
      longitude = location[1].to_s
      location = latitude + longitude
    end

    # the instance variable that is used by all the
    # following methods is set here, using string
    # interpolation to passed in location and the
    # time parameter
    @response = Nokogiri::HTML(open("http://www.google.com/movies?near=#{location}&mid=&hl=en&date=0&view=list&time=#{time}"))
    closest_movies()
  end

  # this method returns an array of the movies playing
  # closest to the location that was provided when the
  # Movies object was instantiated.  It's a crazy ass
  # parsing thing made by Joshua, and it freaks me out
  def closest_movies

    @local_movies = []

    theaters = @response.css(".desc")
    movie_info = []
    theater_hash = {}
    movie_hash = {}

    theaters.each do |theater|

    theater_hash[:id] = "#" + theater.attributes["id"].value
    theater_hash[:name] = theater.css("h2").text
    theater_hash[:address] = theater.css(".info").text


      @response.css(theater_hash[:id]).each do |node|
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

  # this method returns the specific information about
  # a theater from the @local_movies array.  At this
  # point, the method is used solely for testing, as
  # far as I can see, but there may be a use for it
  # that I'm not currently seeing.
  def display_a_sampler(number)
      my_theater = @local_movies[number]
      theater = my_theater[:name]
      address = my_theater[:address]
      movie1 = my_theater[:movies][0]
      movie_time1 = my_theater[:movies][1]
      if (my_theater[:movies][2])
        movie2 = my_theater[:movies][2]
        movie_time2 = my_theater[:movies][3]
      else
        movie2 = ""
        movie_time2 = []
      end

      if (my_theater[:movies][4])
        movie3 = my_theater[:movies][4]
        movie_time3 = my_theater[:movies][5]
      else
        movie3 = ""
        movie_time3 = []
      end



      # here we check the movie time array and see if
      # there is an "empty string" valued in Unicode
      # and delete it if it is equal to "\u200e"
      movie_time1 = movie_time1.delete_if { |element| element == "\u200e" }
      movie_time2 = movie_time2.delete_if { |element| element == "\u200e" }
      movie_time3 = movie_time3.delete_if { |element| element == "\u200e" }

      return @movie_array = [theater, address, [movie1, movie_time1], [movie2, movie_time2], [movie3, movie_time3.delete_if { |element| element == "\u200e"}]]
      # I included a delete_if for the last array in
      # case there isn't another movie showing at the
      # theater

  end

  # this method shows the next set of movies
  # it will display nine movies if they were present
  # in the query, if not, it returns what it has
  # available.  This is do to the times.  If a search is
  # conducted in the AM, there are fewer showings
  # scheduled, so only a couple will be returned
  def next_movies
    my_movies = {
          :movies1 => self.display_a_sampler(0),
          :movies2 => self.display_a_sampler(1),
          :movies3 => self.display_a_sampler(2)
        }
    return my_movies

  end

  # this method returns just the NAMES of the first
  # three movie theaters as an ARRAY
  def theater_names
    my_movie_theaters = [self.display_a_sampler(0)[0],
                          self.display_a_sampler(1)[0],
                          self.display_a_sampler(2)[0]
                        ]

    return my_movie_theaters
  end

  # this method returns the ADDRESSES of the first
  # three movie theaters as an ARRAY
  def theater_addresses
    my_movie_addresses = [display_a_sampler(0)[1],
                          display_a_sampler(1)[1],
                          display_a_sampler(2)[1]
                          ]
    return my_movie_addresses
  end

  # this method returns the TITLES of the the first
  # three movies at each theater as an ARRAY inside
  # an ARRAY
  def movie_titles
    my_movie_titles = [[display_a_sampler(0)[2][0],
                       display_a_sampler(0)[3][0],
                       display_a_sampler(0)[4][0]],
                       [display_a_sampler(1)[2][0],
                       display_a_sampler(1)[3][0],
                       display_a_sampler(1)[4][0]],
                       [display_a_sampler(2)[2][0],
                       display_a_sampler(2)[3][0],
                       display_a_sampler(2)[4][0]]
                      ]
    return my_movie_titles
  end

  # this method returns the TIMES of the first
  # three movies at each theater as an ARRAY inside
  # an ARRAY
  def movie_times
    my_movie_times = [[display_a_sampler(0)[2][1],
                       display_a_sampler(0)[3][1],
                       display_a_sampler(0)[4][1]],
                       [display_a_sampler(1)[2][1],
                       display_a_sampler(1)[3][1],
                       display_a_sampler(1)[4][1]],
                      [display_a_sampler(2)[2][1],
                      display_a_sampler(2)[3][1],
                      display_a_sampler(3)[4][1]]
                    ]
    return my_movie_times
  end

end


