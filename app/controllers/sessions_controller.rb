class SessionsController < ApplicationController
  def create
    user = User.from_omniauth(env["omniauth.auth"])
    session[:user_id] = user.id
    redirect_to root_url, notice: "Signed in!"
  end
  
  def destroy
    user = User.find(session[:user_id])
    user.destroy
    session[:user_id] = nil
    client
    redirect_to root_url, notice: "Signed out!"
  end
end