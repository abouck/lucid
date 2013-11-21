class SearchesController < ApplicationController
	respond_to :html, :json

	def index
		if params[:usersearch]
    	search = Twitter.user_timeline(params[:usersearch])
      @usersearch = Search.analyze(search)
      respond_with(@usersearch)
  	end	
	end
end
