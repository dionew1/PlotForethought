class EventsController < ApplicationController
skip_before_action :verify_authenticity_token
  def create
    result = check_dates
    if result == "Good"
      status_code = GoogleCalendarService.new(params[:start], params[:end], params[:park], current_user).add_to_calendar
      show_message(status_code)
    else
      result
    end
    redirect_to park_path(session[:park_id])
  end

  def show_message(status_code)
    if status_code == 200
      flash[:success] = "Your trip has been saved to your calendar!"
    elsif status_code == 401
      flash[:danger] = "Your session has expired. Please log in again."
    else
      flash[:danger] = "An error has occured and the event has not been added."
    end
  end

  private
    def check_dates
      if params[:start].empty?
        flash[:warning] = "Please enter a start date"
      elsif params[:start].to_date < Date.today
        flash[:warning] = "Choose date in the future."
      elsif params[:end].empty?
        flash[:warning] = "Please enter an end date"
      elsif params[:end].to_date <  params[:start].to_date
        flash[:warning] = "End date cannot be before start date."
      else
        "Good"
      end
    end
end
