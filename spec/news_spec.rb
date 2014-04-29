require 'spec_helper'

describe News do

  describe "Get Headlines Method" do

    it "should return an array" do
      test = News.new("Queens")
      expect(test.get_headlines).to be_an(Array)
    end

    it "should return an array with FIVE elements" do
      test = News.new("Queens")
      test_array = test.get_headlines
      expect(test_array.length).to eq(5)
    end

  end

  describe "Get URLs Method" do

    it "should return an array" do
      test = News.new("Queens")
      expect(test.get_urls).to be_an(Array)
    end

    it "should return an array with FIVE elements" do
      test = News.new("Queens")
      test_array = test.get_urls
      expect(test_array.length).to eq(5)
    end

    it "should return an array containing urls" do
      test = News.new("Queens")
      test_array = test.get_urls
      expect(test_array[0]).to include("http://")
    end

  end

end
