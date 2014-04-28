require 'spec_helper'

describe Weather do

  describe "Current Temp Method" do

    it "should return a string" do
      new_weather = Weather.new("Brooklyn")
      expect(new_weather.current_temp).to be_a(String)
    end


  end


end
