require 'citibikenyc'

class CitiBikeAPI

  # Get a list of all stations
  def station_list
    Citibikenyc.stations
  end

  # Get only the current status for all stations
  def stations_status
    Citibikenyc.stations_status
  end

  # Get branches info
  def branches
    Citibikenyc.branches
  end

end
