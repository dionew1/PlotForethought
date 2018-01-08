class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  include ApplicationHelper::States

  helper_method :current_user, ApplicationHelper::States.instance_methods

  def current_user
    @current_user ||= User.find(session[:id]) if session[:id]
  end

  def render_404
    render file: "#{Rails.root}/public/404", layout: false, status: :not_found
  end
end
