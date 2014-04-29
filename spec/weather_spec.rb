require 'spec_helper'
require 'scrapers/weather_api'

describe Weather do

  describe "Current Temp Method" do

    it "should return a string" do
      new_weather = Weather.new("Brooklyn")
      expect(new_weather.current_temp).to be_a(String)
    end

  end

  describe "Current Weather Method" do

    it "should return a string" do
      new_weather = Weather.new("Queens")
      expect(new_weather.current_weather).to be_a(String)
    end

  end

  describe "Wind Method" do

    it "should return a string" do
      new_weather = Weather.new("Queens")
      expect(new_weather.wind).to be_a(String)
    end

    it "should return a string that contains wind speed" do
      new_weather = Weather.new("Bronx")
      expect(new_weather.wind).to include("MPH")
    end
  end


  describe "Humidity Method" do

    it "should return a string" do
      new_weather = Weather.new("Queens")
      expect(new_weather.humidity).to be_a(String)
    end

    it "should return a string that has a %" do
      new_weather = Weather.new("Queens")
      expect(new_weather.humidity).to include("%")
    end

  end


end
