class SearchesController < ApplicationController
  def index
    if current_user
      client
    end
    @searches = Search.all
  end
end
