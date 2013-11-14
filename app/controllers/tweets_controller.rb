class TweetsController < ApplicationController
  
  def index
    @tweets = Tweet.all
    if params[:search]
    	@tweetsearch = Twitter.search(params[:search], :lang => "en", :count => 200, :result_type => "mixed").results.map
	end
  end

  def new
    @tweet = Tweet.new
  end
  
end