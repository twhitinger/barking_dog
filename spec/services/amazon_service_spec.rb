require "rails_helper"

describe AmazonService do
  context "#item attributes" do
    it "returns item with attriubutes specified for the given keyword" do

      keyword = "cooking"
      all_data = AmazonService.new.get_info(keyword)
    


      # expect(item["DetailPageURL"]).to eq(url)
      # expect(item["ItemAttributes"]["UPC"]).to eq(upc)
      # expect(item["ItemAttributes"]["Feature"][1]).to eq("Irresistible snacking")
      # expect(item["OfferSummary"]["LowestNewPrice"]["FormattedPrice"]).to eq("$3.40")
      # expect(item["EditorialReviews"]["EditorialReview"]["Content"]).to eq("This is one of those snacks we predict will disappear quickly.  So go ahead and enjoy the crunch of these oven roasted almonds.  The flavor packed combination is also a good source of protein to help you get up and go.")
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
