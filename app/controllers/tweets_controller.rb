class TweetsController < ApplicationController
  respond_to :html, :json
  
  def index
    client
    @tweets = Tweet.all 

    if params[:tweetsearch]
    	@tweetsearch = Twitter.search(params[:tweetsearch], :lang => "en", :count => 200, :result_type => "mixed").results.map
	  end

  end

  # def show
  # end
  
end