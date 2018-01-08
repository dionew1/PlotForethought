class ParksController < ApplicationController
  before_action :logged_in?

  def index
    @parks=ParksPresenter.parks_by_state
  end


  private

    def logged_in?
      render_404 unless current_user
    end

end
