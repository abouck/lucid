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

	  helper_method :current_user
  
end
