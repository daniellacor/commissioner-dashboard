class NewsController < ApplicationController

  def index
    @nfl_scrape = News.new('http://bleacherreport.com/fantasy-football')
    @nfl_headlines = @nfl_scrape.get_class_items('.title')
  end

end
