class TweetsController < ApplicationController
  respond_to :html, :json
  
  def index
    @tweets = Tweet.all 

    if params[:tweetsearch]
    	@tweetsearch = Twitter.search(params[:tweetsearch], :lang => "en", :count => 200, :result_type => "mixed").results.map
	  end

  	# this works when you put in @ and the user handle
  	if params[:usersearch]
      	@usersearch = Twitter.user_timeline(params[:usersearch])
  	end

  end

  # def profilesearch
  #   @profilesearch = Profilesearch.all
  #   if @profilesearch
  #     render '/profilesearch/'
  #   end
  # end


  def profiletweets
      @profiletweets = Twitter.user_timeline
      respond_with(Twitter.user_timeline)
  end

  def profilehome
    @profilehome = Twitter.home_timeline
    respond_with(@profilehome)
  end

  def profilementions
    @profilementions = Twitter.mentions_timeline
    respond_with(@profilementions)
  end

  # def new
  #   @tweet = Tweet.new
  # end

  def show
  end
  
end