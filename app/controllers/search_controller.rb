class SearchController < ApplicationController
  def index
    if params['query']

      @items = AmazonItem.get_info(params['query'])
    else
      @items = AmazonItem.by_price(params['keyword'])
    end
  end
end
