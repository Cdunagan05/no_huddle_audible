class SearchController < ApplicationController

  def index
    @nfl_data = SportsFeedService.schedule("2015-2016-regular")
  end


end
