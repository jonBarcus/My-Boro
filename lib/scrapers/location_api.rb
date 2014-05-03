module LocationAPI
  @response = HTTParty.get('http://ip-api.com/json')

  def self.zipcode()
    zip_code = @response["zip"]
    return zip_code
  end

  def self.lat()
    lat = @response["lat"]
    return lat
  end

  def self.lon()
    lon = @response["lon"]
    return lon
  end

  def self.city()
    city = @response["city"]
    return city
  end

end
