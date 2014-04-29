require 'httparty'
require 'pry'

module Restaurant

  @results_array = []

  def self.top_10(latitude, longitude)

    response = HTTParty.get("https://maps.googleapis.com/maps/api/place/nearbysearch/json?location=#{latitude},#{longitude}&radius=500&types=food&sensor=false&types=restaurant&zagat_selected&key=AIzaSyA8OfyjmSJdgy4py_PVNQbQ8a7mrwG7K8U")

    i = 0
    while @results_array.length < 10 do
      @results_array << response["results"][i]
      i += 1
    end

  end

end

Restaurant.top_10(40.741061, -73.989699)

# Revelant calls:
# @response[0]["name"]
# @response[0]["rating"]
# @response[0]["photos"]["photo_reference"]
# @response[0]["vicinity"] returns formatted address

