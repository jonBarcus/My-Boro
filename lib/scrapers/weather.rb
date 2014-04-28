class Weather

  # gets weather for the specified borough
  def initialize(location)

    # Setting the private API key to a variable to be called in the Get request string
    weather_key = ENV['WEATHER_API_KEY']

    # Completes an HTTParty get request to the Wunderground API
    # Statically set the state to NY but allowed for passing in the city (Bronx/Queens/etc.)
    # API information:  http://www.wunderground.com/weather/api/d/docs?d=index&MR=1
    @new_instance = HTTParty.get("http://api.wunderground.com/api/#{weather_key}/conditions/q/NY/#{location}.json")

  end

  # this method returns the current temp as a string
  def current_temp

    temperature = @new_instance["current_observation"]["temperature_string"]

    return temperature

  end


  # returns the current weather type as a string:  Clear, Cloudy, Overcast, Rainy, etc...
  def current_weather
    current_weather_type = @new_instance["current_observation"]["weather"]

    return current_weather_type
  end

  # returns the wind conditions as a string:  "From the NNE at 6.4 MPH Gusting to 6.4 MPH"
  def wind
    current_wind = @new_instance["current_observation"]["wind_string"]

    return current_wind
  end

  # returns the relative humidity as a string:  "39%"
  # perhaps implement a set of conditionals taking the relative humidity
  # and returning a string about the humidity:  "Very humid" or "Not Humid" etc...
  def humidity
    current_humidity = @new_instance["current_observation"]["relative_humidity"]

    return current_humidity
  end

end


