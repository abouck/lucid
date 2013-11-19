class TweetsController < ApplicationController
  
  def index
    client
    @tweets = Tweet.all
    # @profiletweets = Twitter.user_timeline
    # @profilehome = Twitter.home_timeline
    # @profilementions = Twitter.mentions_timeline

    if params[:tweetsearch]
    	@tweetsearch = Twitter.search(params[:tweetsearch], :lang => "en", :count => 200, :result_type => "mixed").results.map
	end

	# this doesnt work.  this only pulls in your own tweets
	if params[:usersearch]
    	@usersearch = Twitter.user_timeline(params[:usersearch])
	end

  end

  def new
    @tweet = Tweet.new
  end
  
end