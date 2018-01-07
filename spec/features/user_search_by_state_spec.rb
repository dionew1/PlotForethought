require 'rails_helper'

feature "User can see states to search by" do
  let!(:user) { create(:user) }

  it "when logged in" do
    allow_any_instance_of(ApplicationController).to receive(:current_user). and_return(user)
    visit root_path

    expect(page).to have_selector ".state", count: 50
    expect(page).to have_content "ALASKA"
end
