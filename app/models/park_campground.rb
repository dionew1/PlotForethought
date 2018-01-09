class ParkCampground

  attr_reader :name, :park_id

  def initialize(campground_info)
    @campground_info = campground_info || {}
    @name            = campground_info[:name]
    @park_id         = campground_info[:id]
    # @direction_info  = campground_info[:directionsOverview]
    # @description     = campground_info[:description]
    # @phone_numbers   = campground_info[:contacts][:phoneNumbers]
    # @emails          = campground_info[:contacts][:emailAddresses]
    # @total_count     = campground_info[:campsites][:totalSites]
    # @tent_count      = campground_info[:campsites][:tentOnly]
    # @rv_count        = campground_info[:campsites][:rvOnly]
    # @group_count     = campground_info[:campsites][:group]
    # @horse_count     = campground_info[:campsites][:horse]
    # @other_count     = campground_info[:campsites][:other]
    # @toilets         = campground_info[:amenities][:toilets]
    # @showers         = campground_info[:amenities][:showers]
    # @trash_recycling = campground_info[:amenities][:trashRecyclingCollection]
    # @laundry         = campground_info[:amenities][:laundry]
    # @onsite_host     = campground_info[:amenities][:staffOrVolunteerHostOnSite]
    # @potable_water   = campground_info[:amenities][:potableWater]
    # @ice             = campground_info[:amenities][:iceAvailableForSale]
    # @firewood        = campground_info[:amenities][:firewoodForSale]
    # @access_roads    = campground_info[:accessibility][:accessRoads]
    # @food_storage_lockers = campground_info[:amenities][:foodStorageLockers]
    # @fire_stove_policy    = campground_info[:accessibility][:fireStovePolicy]
    # @accessibility_info   = campground_info[:accessibility][:adaInfo]
    # @wheelchair_access    = campground_info[:accessibility][:wheelchairAccess]
    # @cell_phone_reception = campground_info[:amenities][:cellPhoneReception]
  end

  private
    attr_reader :raw_campground_info
end
