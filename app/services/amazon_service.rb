class AmazonService
  attr_reader  :connection

  def initialize
    @connection = Faraday.new
  end

  def get_info(keyword)
    # http://webservices.amazon.com/onca/xml?AWSAccessKeyId=AKIAIKNB7T4U6I6F6WBA&AssociateTag=bivatol-20&
    # Keywords=cooking&Operation=ItemSearch&ResponseGroup=ItemAttributes%2COffers%2CReviews%2CSalesRank&SearchIndex=All&Service=AWSECommerceService&Timestamp=2016-09-16T15%3A15%3A47.000Z&Signature=uuMcAA1ZkZN%2B78md5g0LxnFP3ZIS3oNcIOudSsgTwkc%3D
    begin
      app_name = "bivatol-20"
      url = "http://webservices.amazon.com/onca/xml?AWSAccessKeyId=#{ENV['AMAZON_API_KEY']}&AssociateTag=#{app_name}&Keywords=#{keyword}&Operation=ItemSearch&ResponseGroup=ItemAttributes%2COffers%2CReviews%2CSalesRank&SearchIndex=All&Service=AWSECommerceService&Timestamp="
      # &ItemId=#{upcs}&IdType=UPC&SearchIndex=All&Operation=ItemLookup&ResponseGroup=Large&Service=AWSECommerceService&Timestamp="
      url << Time.now.utc.strftime("%Y-%m-%dT%H:%M:%SZ")

      signed_url = create_signature(url)
      response = connection.get do |req|
        req.url signed_url
      end
      result = parse(response)
    end
  end

  private
# http://webservices.amazon.com/onca/xml?AWSAccessKeyId=AKIAIKNB7T4U6I6F6WBA&
# AssociateTag=bivatol-20&Keywords=cooking&Operation=ItemSearch&
# ResponseGroup=ItemAttributes%2COffers%2CReviews%2CSalesRank&
# SearchIndex=All&Service=AWSECommerceService&
# Timestamp=2016-09-16T15%3A15%3A47.000Z&Signature=uuMcAA1ZkZN%2B78md5g0LxnFP3ZIS3oNcIOudSsgTwkc%3D


  def create_signature(url)
    AmazonSignatureService.new(ENV['AMAZON_SECRET_KEY'], url).sign
  end

  def parse(response)
    Crack::XML.parse(response.body)["ItemSearchResponse"]["Items"]["Item"] unless response.nil?
  end

end
