class TweetsController < ApplicationController
  respond_to :html, :json
  
  def index
    client
    @tweets = Tweet.all



    if params[:profilehome]
    @profilehome = Twitter.home_timeline
    respond_with(@profilehome)
    end

    if params[:profilementions]
    @profilementions = Twitter.mentions_timeline
    respond_with(@profilementions)
    end

    if params[:tweetsearch]
    	@tweetsearch = Twitter.search(params[:tweetsearch], :lang => "en", :count => 200, :result_type => "mixed").results.map
	  end

  	# this doesnt work.  this only pulls in your own tweets
  	if params[:usersearch]
      	@usersearch = Twitter.user_timeline(params[:usersearch])
  	end

  end

  def profiletweets
      if params[:profiletweets]
      @profiletweets = Twitter.user_timeline
      respond_with(@profiletweets)
      end
    end

  def new
    @tweet = Tweet.new
  end

  def show
  end
  
end