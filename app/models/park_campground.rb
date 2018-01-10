class ParkCampground

  attr_reader :name, :park_id

  def initialize(campground_info)
    @campground_info = campground_info || {}
    @name            = campground_info[:name]
    @park_id         = campground_info[:id]
  end


  def description
    info = campground_info[:description]
    if info.nil? || info.empty?
      "Information unavailable at this time."
    else
      info
    end
  end

  def direction_info
    info = campground_info[:directionsOverview]
    if info.nil? || info.empty?
      "Information unavailable at this time."
    else
      info
    end
  end

  def contacts
    campground_info[:contacts]
  end

  def phone_numbers #array
    if contacts.nil? || contacts[:phoneNumbers].empty?
      ["Information unavailable at this time."]
    elsif contacts[:phoneNumbers]
      contacts[:phoneNumbers].map { |num| num[:phoneNumber] }
    end
  end

  def emails #array
    if contacts.nil? || contacts[:emailAddresses].empty?
      ["Information unavailable at this time."]
    elsif contacts[:emailAddresses]
      contacts[:emailAddresses].map { |email| email[:emailAddress] }
    end
  end

  def campsites
    campground_info[:campsites]
  end

  def total_count
    if campsites.nil?
      "Unavailable"
    else
      campsites[:totalSites].to_i
    end
  end

  def tent_count
    if campsites.nil?
      "Unavailable"
    else
      campsites[:tentOnly].to_i
    end
  end

  def rv_count
    if campsites.nil?
      "Unavailable"
    else
      campsites[:rvOnly].to_i
    end
  end

  def group_count
    if campsites.nil?
      "Unavailable"
    else
      campsites[:group].to_i
    end
  end

  def horse_count
    if campsites.nil?
      "Unavailable"
    else
      campsites[:horse].to_i
    end
  end

  def other_count
    if campsites.nil?
      "Unavailable"
    else
      campsites[:other].to_i
    end
  end

  def amenities
    campground_info[:amenities]
  end

  def toilets #array
    if amenities.nil? || amenities[:toilets].empty?
      "Information unavailable at this time."
    elsif amenities[:toilets]
      amenities[:toilets].join(" ")
    end
  end

  def showers #array
    if amenities.nil? || amenities[:showers].empty?
      "Information unavailable at this time."
    elsif amenities[:showers]
      amenities[:showers].join(" ")
    end
  end

  def trash_recycling
    if amenities[:trashRecyclingCollection] == false
      "Recyling is not Available."
    elsif amenities.nil? || amenities[:trashRecyclingCollection].empty?
      "Information unavailable at this time."
    else
      amenities[:trashRecyclingCollection]
    end
  end

  def laundry
    if amenities[:laundry] == false
      "Laundry is not available."
    elsif amenities.nil? || amenities[:laundry].empty?
      "Information unavailable at this time."
    else
      amenities[:laundry]
    end
  end

 def onsite_host
   if amenities[:staffOrVolunteerHostOnSite] == false
     "No host on site."
   elsif amenities.nil? || amenities[:staffOrVolunteerHostOnSite].empty?
     "Information unavailable at this time."
   else
     amenities[:staffOrVolunteerHostOnSite]
   end
 end

 def potable_water #array
   if amenities.nil? || amenities[:potableWater].empty?
     "Information unavailable at this time."
   elsif amenities[:potableWater]
     amenities[:potableWater].join(" ")
   end
 end

 def ice
   if amenities[:iceAvailableForSale] == false
     "Ice is not for sale."
   elsif amenities.nil? || amenities[:iceAvailableForSale].empty?
     "Information unavailable at this time."
   else
     amenities[:iceAvailableForSale]
   end
 end

 def firewood
   if amenities[:firewoodForSale] == false
     "Firewood is not for sale."
   elsif amenities.nil? || amenities[:firewoodForSale].empty?
     "Information unavailable at this time."
   else
     amenities[:firewoodForSale]
   end
 end

 def food_storage_lockers
   if amenities[:foodStorageLockers] == false
     "No food storage lockers are available."
   elsif amenities.nil? || amenities[:foodStorageLockers].empty?
     "Information unavailable at this time."
   else
     amenities[:foodStorageLockers]
   end
 end

 def cell_phone_reception
   if amenities[:cellPhoneReception] == false
     "Cell phone reception is not available."
   elsif amenities.nil? || amenities[:cellPhoneReception].empty?
     "Information unavailable at this time."
   else
     amenities[:cellPhoneReception]
   end
 end

 def accessibility
   campground_info[:accessibility]
 end

 def fire_stove_policy
   if accessibility.nil? || accessibility[:fireStovePolicy].empty?
     "Information unavailable at this time."
   else
     accessibility[:fireStovePolicy]
   end
 end

 def access_roads # array
   if accessibility.nil? || accessibility[:accessRoads].empty?
     "Information unavailable at this time."
   else
     accessibility[:accessRoads].join(" ")
   end
 end

 def accessibility_info
   if accessibility.nil? || accessibility[:adaInfo].empty?
     "Information is unavailable at this time."
   else
     accessibility[:adaInfo]
   end
 end

 def wheelchair_access
   if accessibility.nil? || accessibility[:wheelchairAccess].empty?
     "Information is unavailable at this time."
   else
     accessibility[:wheelchairAccess]
   end
 end

  private
    attr_reader :campground_info
end
