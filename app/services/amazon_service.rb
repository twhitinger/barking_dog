class AmazonService
  attr_reader  :connection

  def initialize
    @connection = Faraday.new
  end

  def get_info(keyword)
    app_name = "bivatol-20"
    url = "http://webservices.amazon.com/onca/xml?AWSAccessKeyId=#{ENV['AMAZON_API_KEY']}&AssociateTag=#{app_name}&Keywords=#{keyword}&MinimumPrice=1000&Operation=ItemSearch&ResponseGroup=Images%2CItemAttributes%2COfferFull%2COffers%2CSalesRank&SearchIndex=All&Service=AWSECommerceService&Timestamp="
    url << Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")
    signed_url = create_signature(url)
    response = connection.get do |req|
      req.url signed_url
    end
    result = parse(response)
  end

  def find_item(item_id)
    response = connection.get do |req|
      req.url create_item_signature(item_id)
    end
    Crack::XML.parse(response.body)["ItemLookupResponse"]["Items"]["Item"]
  end

  def find_more_search_results(keyword)
    app_name = "bivatol-20"
    url = "http://webservices.amazon.com/onca/xml?AWSAccessKeyId=#{ENV['AMAZON_API_KEY']}&AssociateTag=#{app_name}&Keywords=#{keyword}&MinimumPrice=1000&Operation=ItemSearch&ResponseGroup=Images%2CItemAttributes%2COfferFull%2COffers%2CSalesRank&SearchIndex=Books&Service=AWSECommerceService&Timestamp="
    url << Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")
    signed_url = create_signature(url)
    response = connection.get do |req|
      req.url signed_url
    end
     Crack::XML.parse(response.body)["ItemSearchResponse"]["Items"]["MoreSearchResultsUrl"]
  end

  private

  def create_signature(url)
    AmazonSignatureService.new(ENV['AMAZON_SECRET_KEY'], url).sign
  end

  def parse(response)
    Crack::XML.parse(response.body)["ItemSearchResponse"]["Items"]["Item"] unless response.nil?
  end

  def create_item_signature(item_id)
    AmazonItemSignature.new(item_id).request_url
  end

end
