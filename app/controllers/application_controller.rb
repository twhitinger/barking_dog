require 'embedly'
require 'json'
require 'mechanize'
class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  helper_method :display

  def display(url)
    embedly_api = Embedly::API.new :key => 'df951974112145b5af768a071c3757b4',
     :user_agent => 'Mozilla/5.0 (compatible; Embedly/0.2; +http://support.embed.ly/)'
    obj = embedly_api.oembed :url => url
    obj.first.html
  end

end
