require "rails_helper"

describe AmazonService do
  context "#item attributes" do
    it "returns item with attriubutes specified for the given keyword" do

      keyword = "cooking"
      all_data = AmazonService.new.get_info(keyword)
      sales_rank = all_data.first["SalesRank"]
      item = all_data.first["ItemAttributes"]
      customer_reviews_url = all_data.first["CustomerReviews"]["IFrameURL"]


      expect(item["Title"]).to eq("Thug Kitchen: The Official Cookbook: Eat Like You Give a F*ck")
      expect(item["Author"]).to eq("Thug Kitchen")
      expect(item["ListPrice"]["FormattedPrice"]).to eq("$25.99")
      expect(sales_rank).to eq(all_data.first["SalesRank"])
      expect(customer_reviews_url).to eq(all_data.first["CustomerReviews"]["IFrameURL"])
    end

    # it "returns item price for the given item upc" do
    #
    #   all_data = AmazonService.new.get_info(keyword)
    #
    #   item1, item2 = all_data[0], all_data[4]
    #   expect(item1["ItemAttributes"]["UPC"]).to eq("041570109489")
    #   expect(item2["ItemAttributes"]["UPC"]).to eq("041570072561")
    # end
  end
end
