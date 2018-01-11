class GoogleCalendarService
  def initialize(start_date, end_date, park)
    byebug
    @start_state = start_date
    @end_date    = end_date
    @park        = park
    @conn        =  Faraday.new(url: 'https://developer.nps.gov/')
  end
end
