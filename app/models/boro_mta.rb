require 'scrapers/mta_api'

# This module is for creation of a new MTA instance.
# The module.new will take a LOCATION and then narrow
# the results based on the location given, and using
# the class methods to do so.
# The module will then return an array with two arrays
# inside, the first listing the names of the lines in
# the specified boro, then an array listing the status
# of each of those lines

module BoroMTA

  def self.new(location)

    response = MTA.new

    if location == "Queens"
      your_mta = [response.queens_lines, response.queens_status]
    elsif location == "Bronx"
      your_mta = [response.bronx_lines, response.bronx_status]
    elsif location == "Manhattan"
      your_mta = [response.manhattan_lines, response.manhattan_status]
    elsif location == "Brooklyn"
      your_mta = [response.brooklyn_lines, response.brooklyn_status]
    elsif location == "Staten Island"
      your_mta = [response.staten_island_lines, response.staten_island_status]
    end

    return your_mta
  end

end
