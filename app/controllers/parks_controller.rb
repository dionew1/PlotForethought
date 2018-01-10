class ParksController < ApplicationController
  before_action :logged_in?

  def index
    if params[:state]
      session[:state] = params[:state]
      @parks=ParksPresenter.new(session[:state]).park_campgrounds_by_state
    else
      redirect_to root_path
    end
  end


  def show
    @park=ParksPresenter.new(session[:state]).park_campgrounds_by_id(params[:id])
  end

  private
  attr_reader :state

    def logged_in?
      render_404 unless current_user
    end
end
