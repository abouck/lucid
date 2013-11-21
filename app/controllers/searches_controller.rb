class SearchesController < ApplicationController
	respond_to :html, :json

  def index
  end

	def search
		if params[:usersearch]
    	search = Twitter.user_timeline(params[:usersearch], :lang => "en", :count => 200)
      @usersearch = Search.analyze(search)
      respond_with(@usersearch)
  	end	
	end
end
