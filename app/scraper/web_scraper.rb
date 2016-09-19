require 'HTTParty'
require 'Nokogiri'
require 'csv'
require 'Faraday'
require 'pry'
require 'open-uri'
require 'open_uri_redirections'
require 'net/http'
require 'mechanize'

agent = Mechanize.new { |agent| agent.user_agent_alias = 'Mac Safari' }


page = agent.get('https://www.amazon.com/gp/search?keywords=food&url=search-alias%3Dstripbooks')
root = Nokogiri::HTML(page.content.strip)

# class="a-size-base a-color-base sx-title"
# scrape_content(root)
binding.pry
# class WebScraper
#
#
# end
