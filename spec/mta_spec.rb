require 'spec_helper'
require 'scrapers/mta_status'

describe "mta text" do 
	it "should be XML" do
		xml_page = File.read('spec/serviceStatus.txt')
		nkg_xml = Nokogiri::XML(xml_page)
		expect( nkg_xml ).to be_a Nokogiri::XML::Document
	end
	it "should display the relevant text description for Sandy Reroute" do
		raw = <<-EOF
			&lt;span class="TitleServiceChange" &gt;Sandy Reroute&lt;/span&gt;
                    &lt;span class="DateStyle"&gt;
                    &amp;nbsp;Posted:&amp;nbsp;04/30/2014&amp;nbsp;12:00PM
                    &lt;/span&gt;&lt;br/&gt;&lt;br/&gt;
                  &lt;STRONG&gt;[FF]&lt;BR&gt;[R] No trains between Whitehall St and Downtown Brooklyn - Take the [N] instead&lt;BR&gt;Transfer between [N] and [R] trains at Canal St and Atlantic Av-Barclays Ctr.&lt;BR&gt;&lt;/STRONG&gt;Weekdays until Oct 2014
                &lt;br/&gt;&lt;br/&gt;
    EOF
    expected_output = "[FF][R] No trains between Whitehall St and Downtown Brooklyn - Take the [N] insteadTransfer between [N] and [R] trains at Canal St and Atlantic Av-Barclays Ctr."
    expect(get_sandy_reroute(raw)).to eq(expected_output)
  end
end