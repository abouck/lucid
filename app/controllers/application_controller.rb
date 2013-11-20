class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery #with: :exception
  # before_filter :load_tweets

  #  def load_tweets
  #    # @tweets = Twitter.user_timeline[0..100] 
  #    @tweets = Twitter.search("iphone", :lang => "en", :count => 200, :result_type => "mixed").results.map
  #    # use the array to set the tweets limit
  #    # For this demonstration lets keep the tweets limited to the first 5 available.
  #  end
    

  private

    def current_user
      @current_user ||= User.find(session[:user_id]) if session[:user_id]
    end

  def client
    if current_user
      Twitter.configure do |config|
      config.consumer_key       = ENV["CONSUMER_KEY"]
      config.consumer_secret    = ENV["CONSUMER_SECRET"]
      config.oauth_token        = current_user.auth_token
      config.oauth_token_secret = current_user.secret_token
      end
    else
       Twitter.configure do |config|
      config.oauth_token        = ""
      config.oauth_token_secret = ""
      end
    end    
  end
  helper_method :current_user, :client
  
end