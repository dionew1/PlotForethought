require 'rails_helper'

feature 'User can login with google account' do
  it "after clicking on login with google link" do
    stub_omniauth

    visit root_path

    expect(page).to have_content "Sign in with Google"

    click_on "Sign in with Google"

    expect(page).to have_content "Welcome"
    expect(page).to have_content "Shawn"
    expect(page).to have_link "Logout"
  end
end
