require 'spec_helper'

describe News do

  describe "The functions of a News object" do

    it "get_headlines method should return an array" do
      test = News.new("Queens")
      expect(test.get_headlines).to be_an(Array)
    end


  end

end
