require 'spec_helper'
require 'scrapers/restaurant_api'

describe RestaurantsAPI do
  let(:new_restaurants_string) {RestaurantsAPI.new("Bronx")}
  let(:new_restaurants_lat_long) {RestaurantsAPI.new(40.741061, -73.989699)}

  describe "A Restaurants Object" do

    it "should not be nil after instantiated with a string" do
      expect(new_restaurants_string).to_not eq(nil)
    end

    it "should not be nil after instantiated with lat/long" do
      expect(new_restaurants_lat_long).to_not eq(nil)
    end

  end

  describe "The Names Method" do

    it "should return an array" do
      expect(new_restaurants_string.names).to be_an(Array)
    end

    it "should return an array of TEN elements" do
      test_array = new_restaurants_string.names
      expect(test_array.length).to eq(10)
    end

  end

  describe "The Addresses Method" do

    it "should return an array" do
      expect(new_restaurants_lat_long.addresses).to be_an(Array)
    end

    it "should return an array of TEN elements" do
      test_array = new_restaurants_lat_long.addresses
      expect(test_array.length).to eq(10)
    end

  end

  describe "The Ratings Method" do

    it "should return an array" do
      expect(new_restaurants_string.ratings).to be_an(Array)
    end

    it "should return an array of TEN elements" do
      test_array = new_restaurants_string.ratings
      expect(test_array.length).to eq(10)
    end

  end

end
