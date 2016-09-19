class AmazonService
  attr_reader  :connection

  def initialize
    @connection = Faraday.new
  end

  def get_info(keyword)
      app_name = "bivatol-20"
      url = "http://webservices.amazon.com/onca/xml?AWSAccessKeyId=#{ENV['AMAZON_API_KEY']}&AssociateTag=#{app_name}&Keywords=#{keyword}&Operation=ItemSearch&ResponseGroup=ItemAttributes%2COffers%2CReviews%2CSalesRank&SearchIndex=All&Service=AWSECommerceService&Timestamp="
      url << Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")
      signed_url = create_signature(url)
      response = connection.get do |req|
        req.url signed_url
      end
      result = parse(response)
  end




  private

  def create_signature(url)
    AmazonSignatureService.new(ENV['AMAZON_SECRET_KEY'], url).sign
  end

  def parse(response)
    Crack::XML.parse(response.body)["ItemSearchResponse"]["Items"]["Item"] unless response.nil?
  end

end
