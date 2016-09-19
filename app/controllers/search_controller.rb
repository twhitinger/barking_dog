class SearchController < ApplicationController
  def index
    @items = AmazonService.new.get_info(params['query'])
  end
end
