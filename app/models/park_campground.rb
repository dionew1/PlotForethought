class ParkCampground < ApplicationRecord

  def initialize(campground_info)
    @campground_info = campground_info || {}
    @direction_info  = campground_info[:directionsOverview]
    @description     = campground_info[:description]
    @phone_number    = campground_info[:contacts][:phoneNumbers][:phoneNumber]
    @email           = campground_info[:contacts][:emailAddresses][:emailAddress]
    @total_count     = campground_info[:campsites][:totalSites]
    @tent_count      = campground_info[:campsites][:tentOnly]
    @rv_count        = campground_info[:campsites][:rvOnly]
    @group_count     = campground_info[:campsites][:group]
    @horse_count     = campground_info[:campsites][:horse]
    @other_count     = campground_info[:campsites][:other]
    @toilets         = campground_info[:amenities][:toilets]
    @showers         = campground_info[:amenities][:showers]
    @trash_recycling = campground_info[:amenities][:trashRecyclingCollection]
    @laundry         = campground_info[:amenities][:laundry]
    @onsite_host     = campground_info[:amenities][:staffOrVolunteerHostOnSite]
    @potable_water   = campground_info[:amenities][:potableWater]
    @ice             = campground_info[:amenities][:iceAvailableForSale]
    @firewood        = campground_info[:amenities][:firewoodForSale]
    @fire_stove_policy    = campground_info[:accessibility][:fireStovePolicy]
    @accessibility_info   = campground_info[:accessibility][:adaInfo]
    @wheelchair_access    = campground_info[:accessibility][:wheelchairAccess]
    @cell_phone_reception = campground_info[:amenities][:cellPhoneReception]
  end


  private
    attr_reader :raw_campground_info
end
