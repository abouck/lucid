class StaticpagesController < ApplicationController
  def home
    client
    Sentimental.load_defaults
    @analyzer = Sentimental.new
  end

  def donotuse
  end
 end