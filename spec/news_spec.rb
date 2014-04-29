require 'spec_helper'
require 'scrapers/news_api'

describe News do

  let(:test) {News.new("Queens")}

  describe "Get Headlines Method" do

    it "should return an array" do
      expect(test.get_headlines).to be_an(Array)
    end

    it "should return an array with FIVE elements" do
      test_array = test.get_headlines
      expect(test_array.length).to eq(5)
    end

  end

  describe "Get URLs Method" do

    it "should return an array" do
      expect(test.get_urls).to be_an(Array)
    end

    it "should return an array with FIVE elements" do
      test_array = test.get_urls
      expect(test_array.length).to eq(5)
    end

    it "should return an array containing urls" do
      test_array = test.get_urls
      expect(test_array[0]).to include("http://")
    end

  end

end
