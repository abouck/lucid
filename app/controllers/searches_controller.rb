class SearchesController < ApplicationController
	
	def index
		@searches = Search.all

		if params[:usersearch]
      	@usersearch = Twitter.user_timeline(params[:usersearch])
  		end	
	end

end
