class EventsController < ApplicationController

  def create
    result = check_dates
    if result == "Good"
      GoogleCalendarService.new(params[:start], params[:end], params[:name])
    else
      result
    end
  end

  private
    def check_dates
      if params[:start].empty?
        flash[:message] = "Please enter a start date"
      elsif params[:start] < Date.today
        flash[:message] = "Choose date in the future."
      elsif params[:end].empty?
        flash[:message] = "Please enter an end date"
      elsif params[:end] <  params[:start]
        flash[:message] = "End date cannot be before start date."
      else
        "Good"
      end
    end
end
