require "rails_helper"

RSpec.describe "User can login" do
  scenario "login" do
    visit "/"

    password = "123456789"
    u = User.create(email: "person@example.com", password: password, password_confirmation: password )

    within "#new_user" do
     fill_in "user_email", with: u.email
     fill_in "user_password", with: password
    end
    click_on "Log in"
    expect(current_path).to eq("/")
  
  end
end
