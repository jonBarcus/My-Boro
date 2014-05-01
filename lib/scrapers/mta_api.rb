require 'nokogiri'
require 'open-uri'

class MTA

  def get_line_status
    # takes the text document, parses into xml
    raw = Nokogiri::XML(open('http://web.mta.info/status/serviceStatus.txt'))

    subways = []

    # creates a hash out of each of the subway line elements
    raw.children.search("subway").search("line").each do |line|
      subways << {
        name: line.children.search("name").text,
        status: line.children.search("status").text,
        text: Nokogiri::HTML(line.children.search("text").text).text.delete("\n")
      } 
    end
  end

  def get_sandy_reroute(raw)
    # step 1: unescape the HTML
    html = CGI::unescape_html(raw)
    # step 2: create a nokogiri document
    doc = Nokogiri::HTML(html)
    # step 3: use css selector
    doc.css('strong').text
  end
  
end