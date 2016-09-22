require "rails_helper"

describe AmazonService do
  context "#item attributes" do
    it "returns item with attriubutes specified for the given keyword" do

      keyword = "cooking"
      all_data = AmazonService.new.get_info(keyword)
      sales_rank = all_data.first["SalesRank"]
      item = all_data.first["ItemAttributes"]

      expect(item["Title"]).to eq("Thug Kitchen: The Official Cookbook: Eat Like You Give a F*ck")
      expect(item["Author"]).to eq("Thug Kitchen")
      expect(item["ListPrice"]["FormattedPrice"]).to eq("$25.99")
      expect(sales_rank).to eq(all_data.first["SalesRank"])
    end

    it "returns item price for the given item upc" do
      item_id = "0766897769191"
      item = AmazonService.new.find_item(item_id)

    
      expect(item["ItemAttributes"]["Title"]).to eq("SUPERIORBAND - Ballet Stretch Band for Dance & Gymnastics Training")

    end

    it "returns a url for the more search results" do
      keyword = "cooking"
      url = AmazonService.new.find_more_search_results(keyword)

      expect(url).to eq("http://www.amazon.com/gp/redirect.html?linkCode=xm2&SubscriptionId=AKIAIKNB7T4U6I6F6WBA&location=http%3A%2F%2Fwww.amazon.com%2Fgp%2Fsearch%3Fkeywords%3Dcooking%26url%3Dsearch-alias%253Dstripbooks&tag=bivatol-20&creative=386001&camp=2025")
    end
  end
end
