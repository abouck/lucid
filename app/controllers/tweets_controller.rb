class TweetsController < ApplicationController
  respond_to :html, :json
  
  def index

    if params[:tweetsearch]
    	search = Twitter.search(params[:tweetsearch], :lang => "en", :count => 200, :result_type => "mixed").results.map
      @tweetsearch = Search.analyze(search)
      respond_with(@tweetsearch)
	  end

  	# this works when you put in @ and the user handle
  	if params[:usersearch]
      	search = Twitter.user_timeline(params[:usersearch])
        @usersearch = Search.analyze(search)
        respond_with(@usersearch)
  	end

  end

  # def profilesearch
  #   @profilesearch = Profilesearch.all
  #   if @profilesearch
  #     render '/profilesearch/'
  #   end
  # end


  # def new
  #   @tweet = Tweet.new
  # end

  def show
  end
  
end