class SessionsController < ApplicationController

  def create
    user = User.create_or_update(request.env["omniauth.auth"])
    session[:id] = user.id
    redirect_to root_path
  end

  def destroy
    session.clear
    redirect_to root_path
  end

end
