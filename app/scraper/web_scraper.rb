require 'nokogiri'
require 'csv'
require 'Faraday'
require 'pry'
require 'open-uri'
require 'open_uri_redirections'
require 'net/http'
require 'mechanize'



class WebScraper
  attr_reader :agent
  def initialize
    @agent = Mechanize.new { |agent| agent.user_agent_alias = 'Mac Safari' }
  end

  def get_more_results(url)
    page = agent.get(url)
    # xsl = Nokogiri::XSLT(File.open("app/scraper/xmlindent.xsl"))
    root = Nokogiri::HTML(page.content.strip)
    pp root
    # r = xsl.apply_to(html).to_s
  end
end
# class="a-size-base a-color-base sx-title"
# scrape_content(root)

# class WebScraper
#
#
# end
