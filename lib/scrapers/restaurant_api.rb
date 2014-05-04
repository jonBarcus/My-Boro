# this class calls the Google Places API
# to be used for providing our application with data
# regarding restaurants in the NYC area
# https://developers.google.com/places/documentation/search
class RestaurantsAPI

  # object instantiation will take either a string ("Queens")
  # or a longitude and latitude (40.741061, -73.989699)
  def initialize(*location)

    # because the application is only used for NYC
    # it will test for specific strings unique to the
    # names of the boroughs OR long/lat
    # if the first location element is not one of the five
    # boroughs, it will then assume long/lat was provided
    if location[0] == "Queens" || location[0] == "Staten Island" || location[0] == "Bronx" || location[0] == "Manhattan" || location[0] == "Brooklyn"
      location = location[0].gsub(" ", "+")
      response = HTTParty.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+#{location}&sensor=false&key=#{ENV['GOOGLE_SEARCH_API_KEY']}&opennow")
    else
      latitude = location[0]
      longitude = location[1]
      @lat_long = true
      response = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&radius=500&types=food&sensor=false&types=restaurant&zagat_selected&key=#{ENV['GOOGLE_SEARCH_API_KEY']}")

    end

    # creating an empty array for the results from the API
    # call to go.  We are also setting up a variable for iteration
    @results_array = []
    i = 0



    # will put the first 10 results from the API call that have a Zagat rating of 3.8 or higher
    # in to the results_array
     while @results_array.length <= 10 do
      if response["results"][i]["rating"] >= 3.8
        @results_array << response["results"][i]
        i += 1
      else
        i = i
      end
      return @results_array
    end


  end

  # this method returns the names of the restaurants
  # in an array
  def names
    i = 0
    name_array = []
    while i < @results_array.length - 1 do
      name_array << @results_array[i]["name"]
      i += 1
    end

    return name_array

  end

  # this method returns the addresses of the
  # restaurants in the array
  def addresses
    i = 0
    address_array = []

    if @lat_long == true
      while i < @results_array.length - 1 do
        address_array << @results_array[i]["vicinity"]
        i += 1
      end
    else
      while i < @results_array.length - 1 do
        address_array << @results_array[i]["formatted_address"]
        i += 1
      end
    end

    return address_array

  end

  # this method returns an array made up of the Zagat
  # ratings of the restaurants
  def ratings
    i = 0
    rating_array = []
    while i < @results_array.length - 1 do
      rating_array << @results_array[i]["rating"]
      i += 1
    end

    return rating_array

  end

end

# Restaurant.top_10(40.741061, -73.989699)

# Relavent calls:
# @response[0]["name"]
# @response[0]["rating"]
# @response[0]["photos"]["photo_reference"]
# @response[0]["vicinity"] returns formatted address

# test = HTTParty.get("https://maps.googleapis.com/maps/api/place/textsearch/json?query=restaurants+in+#{location}&sensor=false&key=AIzaSyA8OfyjmSJdgy4py_PVNQbQ8a7mrwG7K8U&opennow")
