class ApplicationController < ActionController::Base
  require 'twitter'
  require 'pry'
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :load_tweets




  def load_tweets
  @tweets = client.user_timeline # For this demonstration lets keep the tweets limited to the first 5 available.
    print @tweets
  end

  private

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def client
    @client = Twitter::REST::Client.new do |config|
    config.consumer_key        = "ugOVTI98wHp1g9GiZGSItw"
    config.consumer_secret     = "O7I1nDpdkVkqKRUm1OBYjKD8u6DFIJRWnPvQqj00E1Q"
    config.access_token        = current_user.auth_token
    config.access_token_secret = current_user.secret_token
    end
  end
  helper_method :current_user, :client
  
end
