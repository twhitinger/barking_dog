require 'nokogiri'
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
  end
end
