class ParksPresenter

  def initialize(state_code)
    @state_code = state_code
  end

  def park_campgrounds_by_state
    parks_service.campgrounds_by_state[:data].map do |raw_campground_info|
      ParkCampground.new(raw_campground_info)
    end
  end

  private
    attr_reader :state_code

    def parks_service
      ParksService.new(state_code)
    end

end
