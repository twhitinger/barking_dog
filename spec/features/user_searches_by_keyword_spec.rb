require "rails_helper"

RSpec.describe "User can find items by keyword" do
  scenario "searching by valid keyword" do
    # As a user
    # When I visit "/"
    visit "/"
    # And I fill in the search form with cooking
    fill_in "query", with: "cooking"
    # And I click find Items
    click_on "Find Items"
    # Then I should be on page "/search" with parameters visible in the url
    expect(current_path).to eq("/search")
    # Then I should see a list of 10 cooking items
    expect(@items.count).to eq(10)
    # And the items  should be displayed
    # And each item should display Title, Author, Price, SalesRank, CustomerReviews
    expect(page).to have_content("Title")
    expect(page).to have_content("Author")
    expect(page).to have_content("Manufacturer")
    expect(page).to have_content("Price")
    expect(page).to have_content("SalesRank")
    # expect(page).to have_content("CustomerReviews")
  end
end
