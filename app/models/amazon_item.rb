class AmazonItem
  def service
    @service ||= AmazonService.new 
  end
end
