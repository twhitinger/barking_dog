class AmazonItem
  attr_reader :service

  def self.service
    @service ||= AmazonService.new
  end

  def self.get_info(keyword)
    service.get_info(keyword).map do |item|
      RecursiveOpenStruct.new(item)
    end
  end

  def self.find_item(item_id)
    RecursiveOpenStruct.new(service.find_item(item_id))
  end

  def self.find_more_search_results(keyword)
    WebScraper.new.get_more_results((service.find_more_search_results(keyword)))
  end
end
