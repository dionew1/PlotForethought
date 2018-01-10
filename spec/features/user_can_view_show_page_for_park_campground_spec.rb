require 'rails_helper'

feature 'User can view camping_info' do
  let!(:user) { create(:user) }

  it "by selecting a park from index" do
    allow_any_instance_of(ApplicationController).to receive(:current_user). and_return(user)
    visit root_path
    VCR.use_cassette("services/user_can_see_camp_info") do
      click_on "ALASKA"
      click_on "Wonder Lake"

      expect(page).to have_selector(".name")
      expect(page).to have_selector(".description")
      expect(page).to have_selector(".direction_info")
      expect(page).to have_selector(".contact-info")
      expect(page).to have_selector(".site-count-summary")
      expect(page).to have_selector(".amenities")
      expect(page).to have_selector(".accessibility")
    end
  end
end
