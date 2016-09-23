require "rails_helper"

RSpec.describe "User can find items by keyword" do
  scenario "searching by valid keyword" do
    # As a user
    # When I visit "/"

    visit "/"
    password = "123456789"
    u = User.create(email: "person@example.com", password: password, password_confirmation: password )

    within "#new_user" do
     fill_in "user_email", with: u.email
     fill_in "user_password", with: password
    end
    click_on "Log in"
    expect(current_path).to eq("/")
    # And I fill in the search form with cooking
    fill_in "query", with: "test"
    # And I click find Items
    click_on "Find Items"
    # Then I should be on page "/search" with parameters visible in the url
    expect(current_path).to eq("/search")
    # Then I should see a list of 10 cooking items
    # And the items  should be displayed
    # And each item should display Title, Author, Price, SalesRank, CustomerReviews
    expect(page).to have_content("Title")
    expect(page).to have_content("Product Group")
    expect(page).to have_content("Manufacturer")
    expect(page).to have_content("Price")
    expect(page).to have_content("SalesRank")

    click_on "raw_html_scraped"
    # expect(page).to have_content("CustomerReviews")
  end
end
