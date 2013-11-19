class ProfilesearchesController < ApplicationController
	respond_to :html, :json

	def index
		# @ownsearches = Ownsearch.all
	end

	def profiletweets
		@profiletweets = Twitter.user_timeline
		respond_with(@profiletweets)
	end

	def profilehome
		# @own_home_timeline = Twitter.home_timeline
		respond_with(Twitter.home_timeline)
	end

	def profilementions
		respond_with(Twitter.mentions_timeline)
	end

end
