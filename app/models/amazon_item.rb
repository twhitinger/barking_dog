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

end
