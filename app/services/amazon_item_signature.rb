require 'time'
require 'uri'
require 'openssl'
require 'base64'
class AmazonItemSignature
  def initialize(item_id)
    @item_id = item_id
  end
  # Your AWS Access Key ID, as taken from the AWS Your Account page
  # AWS_ACCESS_KEY_ID = ENV['AMAZON_API_KEY']

  # Your AWS Secret Key corresponding to the above ID, as taken from the AWS Your Account page
  # AWS_SECRET_KEY = ENV['AMAZON_SECRET_KEY']

  # The region you are interested in
  def endpoint
    endpoint = "webservices.amazon.com"
  end

  def request_uri
    request_uri = "/onca/xml"
  end

  def params(item_id = "9781598714319" )
    params = {
      "Service" => "AWSECommerceService",
      "Operation" => "ItemLookup",
      "AWSAccessKeyId" => ENV['AMAZON_API_KEY'],
      "AssociateTag" => "bivatol-20",
      "ItemId" => @item_id,
      "IdType" => "EAN",
      "ResponseGroup" => "Images,ItemAttributes,Offers,Reviews,SalesRank",
      "SearchIndex" => "All"
    }
    params["Timestamp"] = Time.now.gmtime.iso8601 if !params.key?("Timestamp")
    params
  end

  # Set current timestamp if not set
  def create_timestamp
     params["Timestamp"] = Time.now.gmtime.iso8601 if !params.key?("Timestamp")
  end
  # Generate the canonical query
  def canonical_query_string
    canonical_query_string = params.sort.collect do |key, value|
      [URI.escape(key.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]")), URI.escape(value.to_s, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))].join('=')
    end.join('&')
  end

  # Generate the string to be signed
  def string_to_sign
    string_to_sign = "GET\n#{endpoint}\n#{request_uri}\n#{canonical_query_string}"
  end

  # Generate the signature required by the Product Advertising API
  def signature
    signature = Base64.encode64(OpenSSL::HMAC.digest(OpenSSL::Digest.new('sha256'), ENV['AMAZON_SECRET_KEY'], string_to_sign)).strip()
  end
  # Generate the signed URL
  def request_url
    request_url = "http://#{endpoint}#{request_uri}?#{canonical_query_string}&Signature=#{URI.escape(signature, Regexp.new("[^#{URI::PATTERN::UNRESERVED}]"))}"
  end

  # puts "Signed URL: \"#{request_url}\""
end
