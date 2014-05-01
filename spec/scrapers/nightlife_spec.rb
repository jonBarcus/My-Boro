require 'spec_helper'
require 'scrapers/nightlife_api'

describe NightlifeAPI do
  let(:new_nightlife_string) {NightlifeAPI.new("Bronx")}
  let(:new_nightlife_lat_long) {NightlifeAPI.new(40.741061, -73.989699)}

  describe "A Restaurants Object" do

    it "should not be nil after instantiated with a string" do
      expect(new_nightlife_string).to_not eq(nil)
    end

    it "should not be nil after instantiated with lat/long" do
      expect(new_nightlife_lat_long).to_not eq(nil)
    end

  end

  describe "The Names Method" do

    it "should return an array" do
      expect(new_nightlife_string.names).to be_an(Array)
    end

    it "should return an array of TEN elements" do
      test_array = new_nightlife_string.names
      expect(test_array.length).to eq(10)
    end

  end

  describe "The Addresses Method" do

    it "should return an array" do
      expect(new_nightlife_lat_long.addresses).to be_an(Array)
    end

    it "should return an array of TEN elements" do
      test_array = new_nightlife_lat_long.addresses
      expect(test_array.length).to eq(10)
    end

  end

  describe "The Ratings Method" do

    it "should return an array" do
      expect(new_nightlife_string.ratings).to be_an(Array)
    end

    it "should return an array of TEN elements" do
      test_array = new_nightlife_string.ratings
      expect(test_array.length).to eq(10)
    end

  end

end
