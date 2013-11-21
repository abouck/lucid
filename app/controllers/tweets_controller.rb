class TweetsController < ApplicationController
  respond_to :html, :json
  
  def index

  end


  def search
    if params[:tweetsearch]
    	search = Twitter.search(params[:tweetsearch], :lang => "en", :count => 200, :result_type => "mixed")
      @tweetsearch = Tweet.analyze(search.attrs[:statuses])
      respond_with(@tweetsearch)
	  end

  end
  
end