require 'rails_helper'

feature "User can search by state" do
  let!(:user) { create(:user) }

  it "when logged in" do
    allow_any_instance_of(ApplicationController).to receive(:current_user). and_return(user)
    visit root_path

    expect(page).to have_selector ".state", count: 50
    expect(page).to have_content "ALASKA"
    VCR.use_cassette("services/user_can_search_for_camp") do
      click_on "ALASKA"

      expect(page).to have_current_path(parks_path, ignore_query: true)
      expect(page).to have_selector ".park"
      expect(page).to have_link "Wonder Lake"
    end
  end
end

feature "An unregistered user" do
  it "cannot search by state" do
    visit root_path

    expect(page).to have_content "Please login to continue"
    expect(page).to have_link "Sign in with Google"

    visit parks_path("AK")

    expect(status_code).to eq 404
  end
end
