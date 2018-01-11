class GoogleCalendarService
  def initialize(start_date, end_date, park, current_user)
    @start_date  = start_date
    @end_date    = end_date
    @park        = park
    @conn        =  Faraday.new(url: 'https://www.googleapis.com/calendar/v3/')
    @current_user = current_user
  end

  def add_to_calendar
    response = conn.post do |req|
      req.url "calendars/primary/events"
      req.headers['Content-Type'] = 'application/json'
      req.headers['Authorization'] = 'Bearer ' + current_user.token
      req.params["key"] = ENV['GOOGLE_CLIENT_SECRET']
      req.body = '{
          "start": {
            "date": "' + start_date +
          '"},
          "end": {
            "date": "' + (end_date.to_date + 1).to_s +
          '"},
          "summary": "Camping at ' +  park + '"
        }'
    end
    response.status
  end

  private
    attr_reader :start_date, :end_date, :park, :conn, :current_user
end
