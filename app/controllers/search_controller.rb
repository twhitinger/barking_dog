

class SearchController < ApplicationController
  def index
    @items = AmazonItem.get_info(params['query'])
  end


  def more_search_results
    @more_search_results = AmazonItem.find_more_search_results(params['query'])
  end

  def show
    @item = AmazonItem.find_item(params[:id])
    @html = display(@item.DetailPageURL)
   @comments = @item.CustomerReviews.IFrameURL
  end
end
