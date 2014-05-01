require 'spec_helper'
require 'scrapers/mta_api'

describe MTA do

  let(:new_mta) { MTA.new }

  describe "an object instance of MTA" do

    it "should not be nil" do
      expect(new_mta).to_not eq(nil)
    end

  end

  describe "Queens" do

    it "should return an array when queens_lines is called" do
      expect(new_mta.queens_lines).to be_an(Array)
    end

    it "queens_lines should return an array of 6 elements" do
      test_array = new_mta.queens_lines
      expect(test_array.length).to eq(6)
    end

  end

  describe "Bronx" do

    it "should return an array when bronx_lines is called" do
      expect(new_mta.bronx_lines).to be_an(Array)
    end

    it "bronx_lines should return an array of 2 elements" do
      test_array = new_mta.bronx_lines
      expect(test_array.length).to eq(3)
    end

  end

  describe "Manhattan" do

    it "should return an array when manhattan_lines is called" do
      expect(new_mta.manhattan_lines).to be_an(Array)
    end

    it "manhattan_lines should return an array of 8 elements" do
      test_array = new_mta.manhattan_lines
      expect(test_array.length).to eq(8)
    end

  end

  describe "Staten Island" do
    it "should return an array when staten_island_lines is called" do
      expect(new_mta.staten_island_lines).to be_an(Array)
    end

    it "should return an array of 1 element" do
      test_array = new_mta.staten_island_lines
      expect(test_array.length).to eq(1)
    end

  end

  describe "Brooklyn" do

    it "should return an array when brooklyn_lines is called" do
      expect(new_mta.brooklyn_lines).to be_an(Array)
    end

    it "should return an array of 8 elements" do
      test_array = new_mta.brooklyn_lines
      expect(test_array.length).to eq(8)
    end

  end

end
