class ParksController < ApplicationController
  before_action :logged_in?

  def index

  end


  private

    def logged_in?
      render_404 unless current_user
    end

end
