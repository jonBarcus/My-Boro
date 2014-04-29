require 'spec_helper'
require 'scrapers/restaurant_api'

describe Restaurants do
  let(:new_restaurants_string) {Restaurants.new("Bronx")}
  let(:new_restaurants_lat_long) {Restaurants.new(40.741061, -73.989699)}

  describe "A Restaurants Object" do

    it "should not be nil after instantiated with a string" do
      expect(new_restaurants_string).to not_eq(nil)
    end

    it "should not be nil after instantiated with lat/long" do
      expect(new_restaurants_lat_long).to not_eq(nil)
    end

  end




end
