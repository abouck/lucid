class ProfilesearchesController < ApplicationController
	respond_to :html, :json

	def index
		
	end

	def profiletweets
		@profiletweets = Twitter.user_timeline
		respond_with(@profiletweets)
	end

	def profilehome
		@profilehome = Twitter.home_timeline
		respond_with(@profilehome)
	end

	def profilementions
		@profilementions = Twitter.mentions_timeline
		respond_with(@profilementions)
	end

end
