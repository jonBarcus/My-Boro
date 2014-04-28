module Location
  @response = HTTParty.get('http://ip-api.com/json')

  def self.zipcode()
    zip_code = @response["zip"]
  end

  def self.lat()
    lat = @response["lat"]
  end

  def self.lon()
    lon = @response["lon"]
  end

  def self.region()
    region = @response["region"]
  end

end
