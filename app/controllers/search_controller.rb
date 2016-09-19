class SearchController < ApplicationController
  def index
    @items = AmazonItem.get_info(params['query'])
  end
end
