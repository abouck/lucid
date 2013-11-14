class OwnsearchesController < ApplicationController
	def index
		# @ownsearches = Ownsearch.all
		@own_timeline = Twitter.user_timeline
		@own_home_timeline = Twitter.home_timeline
		@own_mentions = Twitter.mentions_timeline
	end

	# def show
	# 	@own_timeline = Twitter.user_timeline
	# 	@own_home_timeline = Twitter.home_timeline
	# 	@own_mentions = Twitter.user_mentions

	# end

end
