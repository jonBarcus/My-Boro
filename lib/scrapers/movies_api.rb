require 'rubygems'
require 'nokogiri'
require 'open-uri'


module Movies_api
  include Location

  base_uri = "http://www.google.com/movies?"


  near=brooklyn%2Cny&
  mid=&
  hl=en&
  date=0&
  view=list&
  time=0

  def method_1

  end

end


Mod.class              #=> Module
Mod.constants          #=> [:CONST, :PI, :E]
Mod.instance_methods   #=> [:meth]


fred = Module.new do
  def meth1
    "hello"
  end
  def meth2
    "bye"
  end
end

a = "my string"
a.extend(fred)   #=> "my string"
a.meth1          #=> "hello"
a.meth2          #=> "bye"



+module Location
 +  @response = HTTParty.get('http://ip-api.com/json')
 +
 +  def self.zipcode()
 +    zip_code = @response["zip"]
 +  end
 +
 +  def self.lat()
 +    lat = @response["lat"]
 +  end
 +
 +  def self.lon()
 +    lon = @response["lon"]
 +  end
 +
 +  def self.region()
 +    region = @response["region"]
 +  end
 +
 +end

