require 'spec_helper'
require 'scrapers/weather_api'

describe WeatherAPI do

  let(:new_weather) { WeatherAPI.new("Brooklyn")}

  describe "Current Temp Method" do

    it "should return a string" do
      expect(new_weather.current_temp).to be_a(String)
    end

  end

  describe "Current Weather Method" do

    it "should return a string" do
      expect(new_weather.current_weather).to be_a(String)
    end

  end

  describe "Wind Method" do

    it "should return a string" do
      expect(new_weather.wind).to be_a(String)
    end

    it "should return a string that contains wind speed" do
      expect(new_weather.wind).to include("MPH")
    end
  end


  describe "Humidity Method" do

    it "should return a string" do
      expect(new_weather.humidity).to be_a(String)
    end

    it "should return a string that has a %" do
      expect(new_weather.humidity).to include("%")
    end

  end


end
