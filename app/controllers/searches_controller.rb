class SearchesController < ApplicationController
	
	def index

		if params[:usersearch]
      	search = Twitter.user_timeline(params[:usersearch])
      	@usersearch = Search.analyze(search)
  	end
	end

	# def new
	# 	@search = Search.new
	# end

	# def show

	# end

	# def create
	# 	@tweetsearch = Twitter.search(params[:search][:search_name], :lang => "en", :count => 200, :result_type => "mixed").results.map
	# 	# @tweets = Twitter.user_timeline
	# end

end
