class ParksPresenter

  def initialize(state_code)
    @state_code = state_code
  end

  def park_campgrounds_by_state
    filter_parks.map do |filtered_info|
      ParkCampground.new(filtered_info)
    end
  end

  def park_campgrounds_by_id(id)
    park_campgrounds_by_state.find do |park|
      park.park_id == id.to_i
    end
  end

  private
    attr_reader :state_code

    def parks_service
      ParksService.new(state_code)
    end

    def filter_parks
      result = parks_service.campgrounds_by_state[:data]
      if result != 0
        result.select do |raw_campground_info|
          (!raw_campground_info[:name].is_a? Integer) && raw_campground_info[:name].length > 5
        end
      end
    end

end
