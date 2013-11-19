class OwnsearchesController < ApplicationController
	respond_to :html, :json

	def index
		# @ownsearches = Ownsearch.all
		# @own_timeline = Twitter.user_timeline
		# @own_home_timeline = Twitter.home_timeline
		# @own_mentions = Twitter.mentions_timeline
	end

	def user_tweets
		@own_timeline = Twitter.user_timeline
		respond_with(@own_timeline)
	end

	def user_home_tweets
		# @own_home_timeline = Twitter.home_timeline
		respond_with(Twitter.home_timeline)
	end

	def user_mentions
		respond_with(Twitter.mentions_timeline)
	end

end
