RSpec.describe "User can click on a item and return info" do
  scenario "searchshow" do
    visit "/"
    password = "123456789"
    u = User.create(email: "person@example.com", password: password, password_confirmation: password )

    within "#new_user" do
      fill_in "user_email", with: u.email
      fill_in "user_password", with: password
    end
    click_on "Log in"
    expect(current_path).to eq("/")

    click_on "Chat with Barkers"
    expect(page).to have_content("Chat rooms")

    click_on "New chat room"

    expect(page).to have_content("Title")
    fill_in "chat_room_title", with: "happy"
    click_on "Add!"
    expect(page).to have_content("Enter happy")
    click_on "Enter happy"
    fill_in "message_body", with: "test"


    # click_button "Submit"
    # expect(page).to have_content("Title")
  end
end
