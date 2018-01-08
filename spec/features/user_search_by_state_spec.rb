require 'rails_helper'

feature "User can search by state" do
  let!(:user) { create(:user) }

  it "when logged in" do
    allow_any_instance_of(ApplicationController).to receive(:current_user). and_return(user)
    visit root_path

    expect(page).to have_selector ".state", count: 50
    expect(page).to have_content "ALASKA"

    click_on "ALASKA"

    
  end
end

feature "An unregistered user" do
  it "cannot search by state" do
    visit root_path

    expect(page).to have_content "Please login to continue"
    expect(page).to have_link "Sign in with Google"
  end
end
