class SearchesController < ApplicationController
  def index
    client
    @searches = Search.all
  end
end
