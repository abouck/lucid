class ProfilesearchesController < ApplicationController
	respond_to :html, :json

	def index
		# @ownsearches = Ownsearch.all
	end

  def profiletweets
      search = Twitter.user_timeline
      @profiletweets = Search.analyze(search)
      respond_with(@profiletweets)
  end

  def profilehome
    search = Twitter.home_timeline
    @profilehome = Search.analyze(search)
    respond_with(@profilehome)
  end

  def profilementions
    search = Twitter.mentions_timeline
    @profilementions = Search.analyze(search)
    respond_with(@profilementions)
  end

end
