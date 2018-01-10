require 'rails_helper'

describe ParksService do
  describe "campgrounds" do
    it "returns National Park Campground information" do
      VCR.use_cassette("services/campgrounds") do
        camps = ParksPresenter.new("AK").park_campgrounds_by_state
        camp = camps.first

        expect(camp.name).to eq "Wonder Lake"
        expect(camp.park_id).to eq 29
        expect(camp.total_count).to eq 28
      end
    end
  end
end
