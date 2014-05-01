require 'open-uri'

# this class creates an instance of the MTA status
# for Subways in the boros of NYC
# A new instance creates a hash and then runs the
# methods specific to the boroughs after populating the
# hash.  See the comments about the borough methods
# for more specific details
class MTA

  def initialize
    # takes the text document, parses into xml
    raw = Nokogiri::XML(open('http://web.mta.info/status/serviceStatus.txt'))

    @subways = []

    # creates a hash out of each of the subway line elements
    raw.children.search("subway").search("line").each do |line|
      @subways << {
        name: line.children.search("name").text,
        status: line.children.search("status").text,
        text: Nokogiri::HTML(line.children.search("text").text).text.delete("\n")
      }
    end

    queens()
    bronx()
    brooklyn()
    manhattan()
    staten_island()

  end

  # this method takes the @subways array and selects
  # the lines that are physically located in the borough
  # of Queens.  It creates two arrays as instance variables
  # :  one with the names of the lines, the other with the
  # status of those lines.
  def queens

    @queens_lines_name = []
    @queens_lines_status = []

    @subways.each do |line|
      if line[:name] == "7" || line[:name] == "NQR" || line[:name] == "JZ" || line[:name] == "G"
        @queens_lines_name << line[:name]
        @queens_lines_status << line[:status]
      elsif line[:name] == "ACE"
        line[:name] = "E"
        @queens_lines_name << line[:name]
        @queens_lines_status << line[:status]
      elsif line[:name] == "BDFM"
        line[:name] = "FM"
        @queens_lines_name << line[:name]
        @queens_lines_status << line[:status]
      elsif line[:name] == "ACE"
        line[:name] == "A"
        @queens_lines_name << line[:name]
        @queens_lines_status << line[:status]
      end
    end

  end

  # this method returns an array including the names
  # of the lines that are located in Queens
  def queens_lines
    return @queens_lines_name
  end
  # this method returns an array including the status
  # of the lines (related to the queens_lines() return)
  def queens_status
    return @queens_lines_status
  end


  # this method takes the @subways array and selects
  # the lines that are physically located in the borough
  # of Bronx.  It creates two arrays as instance variables
  # :  one with the names of the lines, the other with the
  # status of those lines.
  def bronx

    @bronx_lines_names = []
    @bronx_lines_status = []

    @subways.each do |line|
      if line[:name] == "456"
        @bronx_lines_names << line[:name]
        @bronx_lines_status << line[:status]
      elsif line[:name] == "BDFM"
        line[:name] = "BD"
        @bronx_lines_names << line[:name]
        @bronx_lines_status << line[:status]
      elsif line[:name] == "123"
        line[:name] = "2"
        @bronx_lines_names << line[:name]
        @bronx_lines_status << line[:status]
      end

    end

  end

  def bronx_lines
    return @bronx_lines_names
  end

  def bronx_status
    return @bronx_lines_status
  end

  # this method takes the @subways array and selects
  # the lines that are physically located in the borough
  # of Brooklyn.  It creates two arrays as instance
  # variables:  one with the names of the lines, the other
  # with the status of those lines.
  def brooklyn

    @brooklyn_lines_names = []
    @brooklyn_lines_status = []

    @subways.each do |line|
      if line[:name] == "NQR" || line[:name] == "BDFM" || line[:name] == "G" || line[:name] == "JZ" || line[:name] == "L"
        @brooklyn_lines_names << line[:name]
        @brooklyn_lines_status << line[:status]
      elsif line[:name] == "ACE"
        line[:name] = "AC"
        @brooklyn_lines_names << line[:name]
        @brooklyn_lines_status << line[:status]
      elsif line[:name] == "123"
        line[:name] = "3"
        @brooklyn_lines_names << line[:name]
        @brooklyn_lines_status << line[:status]
      elsif line[:name] == "456"
        line[:name] = "45"
        @brooklyn_lines_names << line[:name]
        @brooklyn_lines_status << line[:status]
      end
    end

  end

  def brooklyn_lines
    return @brooklyn_lines_names
  end

  def brooklyn_status
    return @brooklyn_lines_status
  end

  # this method takes the @subways array and selects
  # the lines that are physically located in the borough
  # of Manhattan.  It creates two arrays as instance
  # variables:  one with the names of the lines, the other
  # with the status of those lines.
  def manhattan

    @manhattan_lines_names = []
    @manhattan_lines_status = []

    @subways.each do |line|
      if line[:name] == "ACE" || line[:name] == "123" || line[:name] == "NQR" || line[:name] == "456" || line[:name] == "7" || line[:name] == "BDFM" || line[:name] == "L" || line[:name] == "S"
        @manhattan_lines_names << line[:name]
        @manhattan_lines_status << line[:status]
      end
    end

  end

  def manhattan_lines
    return @manhattan_lines_names
  end

  def manhattan_status
    return @manhattan_lines_status
  end

  # this method takes the @subways array and selects
  # the lines that are physically located in the borough
  # of Staten Island.  It creates two arrays as instance
  # variables:  one with the names of the lines, the other
  # with the status of those lines.
  def staten_island

    @si_lines_names = []
    @si_lines_status = []

    @subways.each do |line|
      if line[:name] == "SIR"
        @si_lines_names << line[:name]
        @si_lines_status << line[:status]
      end
    end

  end

  def staten_island_lines
    return @si_lines_names
  end

  def staten_island_status
    return @si_lines_status
  end

end
