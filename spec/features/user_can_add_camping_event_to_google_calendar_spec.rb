require 'rails_helper'


feature 'User can add camping event to google calendar' do
  let!(:user) { create(:user) }

  it "by clicking on save to calendar with valid dates" do
    allow_any_instance_of(ApplicationController).to receive(:current_user). and_return(user)
    visit root_path
    VCR.use_cassette("services/user_can_add_event_to_calendar") do
      click_on "ALASKA"
      click_on "Wonder Lake"

      expect(page).to have_button "Save to Calendar"
      expect(page).to have_selector "input", count: 2

      fill_in "start", with: "2018-01-18"
      fill_in "end", with: "2018-01-19"

      click_on "Save to Calendar"

      expect(page).to have_content "Your trip has been saved to your calendar!"
    end
  end
end
