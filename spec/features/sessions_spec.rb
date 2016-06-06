require 'rails_helper'

RSpec.feature "Log-In Management", :type => :feature do
  scenario "Existing User Logs In" do
    visit "/"
    click_on "Log-In"
    expect(page).to have_text("PASSWORD")
  end
end

RSpec.feature "Create League", :type => :feature do
  scenario "Commissioner Creates New League" do
    current_user = Commissioner.create(name: "Test", email: "something@fi.com", password: "password", phone_number: "925-212-0841")
    visit "leagues/new"
    fill_in "league_name", :with => "My New League"
    click_on "Create"
    expect(page).to have_text("CURRENT LEAGUE: MY NEW LEAGUE")
  end
end
