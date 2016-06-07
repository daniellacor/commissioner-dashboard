class HeadlinesController < ApplicationController

  def index
    @league = current_user.leagues.first
    require 'open-uri'
    doc = Nokogiri::HTML(open("http://bleacherreport.com/nfl"))


    @headlinesLinks = []
    doc.css('ol a')[1..10].each do |headline|
      title = headline.children[1].children.text.strip
      link = headline.attribute('href').value
      @headlinesLinks << link
    end
    @headlinesArr
  end

end
