class ParksService

  def initialize(filter)
    @filter = filter || {}
    @conn =  Faraday.new(url: 'https://developer.nps.gov/')
  end

  def campgrounds_by_state
    response = conn.get do |req|
      req.url "api/v1/campgrounds"
      req.params["stateCode"] = filter
      req.params["api_key"] = ENV["NPS_KEY"]
    end
    JSON.parse(response.body, symbolize_names: true)
  end

  private
    attr_reader :conn, :filter
end
