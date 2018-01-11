class EventsController < ApplicationController
skip_before_action :verify_authenticity_token
  def create
    result = check_dates
    if result == "Good"
      GoogleCalendarService.new(params[:start], params[:end], params[:park])
    else
      result
    end
  end

  private
    def check_dates
      if params[:start].empty?
        flash[:message] = "Please enter a start date"
      elsif params[:start].to_date < Date.today
        flash[:message] = "Choose date in the future."
      elsif params[:end].empty?
        flash[:message] = "Please enter an end date"
      elsif params[:end].to_date <  params[:start].to_date
        flash[:message] = "End date cannot be before start date."
      else
        "Good"
      end
    end
end
