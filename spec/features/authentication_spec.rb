require 'rails_helper'

RSpec.feature "Authentication", type: :feature do
  scenario "signup and login to a new account" do
    visit "/auth"

    fill_in "name@example.com", with: "user@example.com"
    fill_in "Password", with: "123456"
    click_button "Submit"
    expect(page).to have_content "Welcome user@example.com"
  end

  scenario "login to a existing account" do
    user = create(:user, email: "user1@example.com", password: "12345678")
    visit "/auth"

    fill_in "name@example.com", with: user.email
    fill_in "Password", with: user.password
    click_button "Submit"
    expect(page).to have_content "Welcome user1@example.com"
  end

  scenario "failed login to a existing account" do
    user = create(:user, email: "user1@example.com", password: "12345678")
    visit "/auth"

    fill_in "name@example.com", with: user.email
    fill_in "Password", with: user.password + "9"
    click_button "Submit"
    expect(page).to have_content "Invalid password"
  end

  scenario "failed to submit form when blank" do
    visit "/auth"

    fill_in "name@example.com", with: ""
    fill_in "Password", with: ""
    click_button "Submit"
    expect(page).to have_content "Password can't be blank Email can't be blank"
  end
end
