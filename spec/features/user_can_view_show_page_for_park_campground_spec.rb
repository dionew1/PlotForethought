require 'rails_helper'

feature 'User can view camping_info' do
  let!(:user) { create(:user) }

  it "selecting a park from index" do
    allow_any_instance_of(ApplicationController).to receive(:current_user). and_return(user)
    visit root_path
    click_on "ALASKA"
    click_on "Wonder Lake"

    expect(page).to have_selector(".name")
    expect(page).to have_selector(".description")
    expect(page).to have_selector(".direction_info")
    expect(page).to have_selector(".phone_numbers")
    expect(page).to have_selector(".emails")
    expect(page).to have_selector(".total_count")
    expect(page).to have_selector(".tent_count")
    expect(page).to have_selector(".rv_count")
    expect(page).to have_selector(".group_count")
    expect(page).to have_selector(".horse_count")
    expect(page).to have_selector(".other_count")
    expect(page).to have_selector(".toilets")
    expect(page).to have_selector(".showers")
    expect(page).to have_selector(".trash_recycling")
    expect(page).to have_selector(".laundry")
    expect(page).to have_selector(".onsite_host")
    expect(page).to have_selector(".potable_water")
    expect(page).to have_selector(".ice")
    expect(page).to have_selector(".firewood")
    expect(page).to have_selector(".access_roads")
    expect(page).to have_selector(".food_storage_lockers")
    expect(page).to have_selector(".fire_stove_policy")
    expect(page).to have_selector(".accessibility_info")
    expect(page).to have_selector(".wheelchair_access")
    expect(page).to have_selector(".cell_phone_reception")
  end
end
