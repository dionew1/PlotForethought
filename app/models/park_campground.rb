class ParkCampground

  attr_reader :name, :park_id

  def initialize(campground_info)
    @campground_info = campground_info || {}
    @name            = campground_info[:name]
    @park_id         = campground_info[:id]
  end


  def description
    info = campground_info[:description]
    if info.empty? || info.nil?
      "Information unavailable at this time."
    else
      info
    end
  end

  def direction_info
    campground_info[:directionsOverview]
  end

  def phone_numbers #array
    phone_nums = campground_info[:contacts]
    if phone_nums.nil? || phone_nums[:phoneNumbers].empty?
      ["Information unavailable at this time."]
    elsif phone_nums[:phoneNumbers]
      phone_nums[:phoneNumbers].map { |num| num[:phoneNumber] }
    end
  end

  def emails #array
    email_info = campground_info[:contacts]
    if email_info.nil? || email_info[:emailAddresses].empty?
      ["Information unavailable at this time."]
    elsif email_info[:emailAddresses]
      email_info[:emailAddresses].map { |email| email[:emailAddress] }
    end
  end

  def total_count
    campground_info[:campsites][:totalSites].to_i
  end

  def tent_count
    campground_info[:campsites][:tentOnly].to_i
  end

  def rv_count
    campground_info[:campsites][:rvOnly].to_i
  end

  def group_count
    campground_info[:campsites][:group].to_i
  end

  def horse_count
    campground_info[:campsites][:horse].to_i
  end

  def other_count
    campground_info[:campsites][:other].to_i
  end

  def toilets #array
    toilet_info = campground_info[:amenities]
    if toilet_info.nil? || toilet_info[:toilets].empty?
      "Information unavailable at this time."
    elsif toilet_info[:toilets]
      toilet_info[:toilets].join(" ")
    end
  end

  def showers #array
    shower_info = campground_info[:amenities]
    if shower_info.nil? || shower_info[:showers].empty?
      "Information unavailable at this time."
    elsif shower_info[:showers]
      shower_info[:showers].join(" ")
    end
  end

  def trash_recycling
    recycling = campground_info[:amenities][:trashRecyclingCollection]
    if recycling == false
      "Recyling is not Available."
    elsif recycling.nil?
      "Information unavailable at this time."
    else
      recycling
    end
  end

  def laundry
    laundry_info = campground_info[:amenities][:laundry]
    if laundry_info == false
      "Laundry is not available."
    elsif laundry_info.nil?
      "Information unavailable at this time."
    else
      laundry_info
    end
  end

 def onsite_host
   host = campground_info[:amenities][:staffOrVolunteerHostOnSite]
   if host == false
     "No host on site."
   elsif host.nil?
     "Information unavailable at this time."
   else
     host
   end
 end

 def potable_water #array
   water_info = campground_info[:amenities]
   if water_info.nil? || water_info[:potableWater].empty?
     "Information unavailable at this time."
   elsif water_info[:potableWater]
     water_info[:potableWater].join(" ")
   end
 end

 def ice
   ice_info = campground_info[:amenities][:iceAvailableForSale]
   if ice_info == false
     "Ice is not for sale."
   elsif ice_info.nil?
     "Information unavailable at this time."
   else
     ice_info
   end
 end

 def firewood
   wood_info = campground_info[:amenities][:firewoodForSale]
   if wood_info == false
     "Firewood is not for sale."
   elsif wood_info.nil?
     "Information unavailable at this time."
   else
     wood_info
   end
 end

 def food_storage_lockers
  storage= campground_info[:amenities][:foodStorageLockers]
   if storage == false
     "No food storage lockers are available."
   elsif storage.nil?
     "Information unavailable at this time."
   else
     storage
   end
 end

 def cell_phone_reception
   reception = campground_info[:amenities][:cellPhoneReception]
   if reception == false
     "Cell phone reception is not available."
   elsif reception.nil?
     "Information unavailable at this time."
   else
     reception
   end
 end

 def check_acce

 def fire_stove_policy
   policy = campground_info[:accessibility]
   if policy.empty? || policy.nil?
     "Information is not available."
   else
     policy[:fireStovePolicy]
   end
 end

 def access_roads # array
   roads = campground_info[:accessibility]
   if roads.nil? || roads[:accessRoads].empty?
     "Information unavailable at this time."
   elsif roads[:accessRoads]
     roads[:accessRoads].join(" ")
   end
 end

 def accessibility_info
   ada_info = campground_info[:accessibility]
   if ada_info.empty? || ada_info.nil?
     "Information is unavailable at this time."
   else
     ada_info[:adaInfo]
   end
 end

 def wheelchair_access
   wheelchair = campground_info[:accessibility][:wheelchairAccess]
   if wheelchair.empty? || wheelchair.nil?
     "Information is unavailable at this time."
   else
     wheelchair[:wheelchairAccess]
   end
 end

  private
    attr_reader :campground_info
end
