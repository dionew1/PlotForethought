class ParksPresenter

  def initialize(state_code)
    @state_code = state_code
  end

  def parks_by_state
    parks_service.campgrounds_by_state
  end

  private
    attr_reader :state_code

    def parks_service
      ParksService.new(state_code)
    end

end
