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

    it "should include the 7 line" do
      expect(new_mta.queens_lines).to include("7")
    end

    it "should include the NQR" do
      expect(new_mta.queens_lines).to include("NQR")
    end

    it "should include the G line" do
      expect(new_mta.queens_lines).to include("G")
    end

    it "should include the AE lines" do
      expect(new_mta.queens_lines).to include("AE")
    end

    it "should include the FM lines" do
      expect(new_mta.queens_lines).to include("FM")
    end

    it "should include the JZ lines" do
      expect(new_mta.queens_lines).to include("JZ")
    end

    # it "queens_status should return an array with values of SERVICE CHANGE/PLANNED WORK/DELAYS/GOOD SERVICE" do
    #   expect(new_mta.queens_status).to include("GOOD SERVICE" || "PLANNED WORK" || "DELAYS" || "SERVICE CHANGE" || "SANDY REROUTE")
    # end
  end

  describe "Bronx" do

    it "should return an array when bronx_lines is called" do
      expect(new_mta.bronx_lines).to be_an(Array)
    end

    it "bronx_lines should return an array of 3 elements" do
      test_array = new_mta.bronx_lines
      expect(test_array.length).to eq(3)
    end

    it "should include the 456" do
      expect(new_mta.bronx_lines).to include("456")
    end

    it "should include the BD" do
      expect(new_mta.bronx_lines).to include("BD")
    end

    it "should include the 2 line" do
      expect(new_mta.bronx_lines).to include("2")
    end

    # it "bronx_status should return an array with values of SERVICE CHANGE/PLANNED WORK/DELAYS/GOOD SERVICE" do
    #   expect(new_mta.bronx_status).to include("GOOD SERVICE" || "PLANNED WORK" || "DELAYS" || "SERVICE CHANGE" || "SANDY REROUTE")
    # end

  end

  describe "Manhattan" do

    it "should return an array when manhattan_lines is called" do
      expect(new_mta.manhattan_lines).to be_an(Array)
    end

    it "manhattan_lines should return an array of 8 elements" do
      test_array = new_mta.manhattan_lines
      expect(test_array.length).to eq(8)
    end

    it "should include the ACE" do
      expect(new_mta.manhattan_lines).to include("ACE")
    end

    it "should include the 123" do
      expect(new_mta.manhattan_lines).to include("123")
    end

    it "should include the NQR" do
      expect(new_mta.manhattan_lines).to include("NQR")
    end

    it "should include the 456" do
      expect(new_mta.manhattan_lines).to include("456")
    end

    it "should include the 7" do
      expect(new_mta.manhattan_lines).to include("7")
    end

    it "should include the BDFM" do
      expect(new_mta.manhattan_lines).to include("BDFM")
    end

    it "should include the L" do
      expect(new_mta.manhattan_lines).to include("L")
    end

    it "should include the S" do
      expect(new_mta.manhattan_lines).to include("S")
    end

    # it "manhattan_status should return an array with values of SERVICE CHANGE/PLANNED WORK/DELAYS/GOOD SERVICE" do
    #   expect(new_mta.manhattan_status).to include("GOOD SERVICE" || "PLANNED WORK" || "DELAYS" || "SERVICE CHANGE" || "SANDY REROUTE")
    # end
  end

  describe "Staten Island" do
    it "should return an array when staten_island_lines is called" do
      expect(new_mta.staten_island_lines).to be_an(Array)
    end

    it "should return an array of 1 element" do
      test_array = new_mta.staten_island_lines
      expect(test_array.length).to eq(1)
    end

    it "should include the SIR" do
      expect(new_mta.staten_island_lines).to include("SIR")
    end

    # it "staten_island_status should return an array with values of SERVICE CHANGE/PLANNED WORK/DELAYS/GOOD SERVICE" do
    #   expect(new_mta.staten_island_status).to include("GOOD SERVICE" || "PLANNED WORK" || "DELAYS" || "SERVICE CHANGE" || "SANDY REROUTE")
    # end

  end

  describe "Brooklyn" do

    it "should return an array when brooklyn_lines is called" do
      expect(new_mta.brooklyn_lines).to be_an(Array)
    end

    it "should return an array of 8 elements" do
      test_array = new_mta.brooklyn_lines
      expect(test_array.length).to eq(8)
    end

    it "should include the NQR" do
      expect(new_mta.brooklyn_lines).to include("NQR")
    end

    it "should include the BDFM" do
      expect(new_mta.brooklyn_lines).to include("BDFM")
    end

    it "should include the G" do
      expect(new_mta.brooklyn_lines).to include("G")
    end

    it "should include the JZ" do
      expect(new_mta.brooklyn_lines).to include("JZ")
    end

    it "should include the AC" do
      expect(new_mta.brooklyn_lines).to include("AC")
    end

    it "should include the 3" do
      expect(new_mta.brooklyn_lines).to include("3")
    end

    it "should include the 45" do
      expect(new_mta.brooklyn_lines).to include("45")
    end

    it "should include the L" do
      expect(new_mta.brooklyn_lines).to include("L")
    end

    # it "brooklyn_status should return an array with values of SERVICE CHANGE/PLANNED WORK/DELAYS/GOOD SERVICE" do
    #   expect(new_mta.brooklyn_status).to include("GOOD SERVICE" || "PLANNED WORK" || "DELAYS" || "SERVICE CHANGE" || "SANDY REROUTE")
    # end
  end

end
