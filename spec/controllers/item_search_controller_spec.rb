require 'spec_helper'
require 'rails_helper'


RSpec.describe ItemSearch, vcr: true do

  context "can access api endpoint" do
    it "can access api and has desired attributes" do
      # As a user
      # When I visit "/"
      # And I fill in the search form with cooking
      # And I click "Locate"
      # Then I should be on page "/search" with parameters visible in the url
      # Then I should see a list of the 10 items related to cooking
      # And for each of the items I should see Name, Price, Image
    end
  end
end

# raw_data = {:bioguide_id=>"E000295", :birthday=>"1970-07-01", :chamber=>"senate", :contact_form=>nil, :crp_id=>"N00035483", :district=>nil, :facebook_id=>"351671691660938", :fax=>nil, :fec_ids=>["S4IA00129"], :first_name=>"Joni", :gender=>"F", :govtrack_id=>"412667", :in_office=>true, :last_name=>"Ernst", :leadership_role=>nil, :lis_id=>"S376", :middle_name=>nil, :name_suffix=>nil, :nickname=>nil, :oc_email=>"Sen.Ernst@opencongress.org", :ocd_id=>"ocd-division/country:us/state:ia", :office=>"111 Russell Senate Office Building", :party=>"R", :phone=>"202-224-3254", :senate_class=>2, :state=>"IA", :state_name=>"Iowa", :state_rank=>"junior", :term_end=>"2021-01-03", :term_start=>"2015-01-06", :thomas_id=>"02283", :title=>"Sen", :twitter_id=>"SenJoniErnst", :website=>"http://www.ernst.senate.gov/public"}
# legislator = Legislator.new(raw_data)
# expect(legislator.name).to eq("Joni Ernst")
