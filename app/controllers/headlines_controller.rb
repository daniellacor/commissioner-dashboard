class HeadlinesController < ApplicationController

  def index
    @league = current_user.leagues.first
    require 'open-uri'
    doc = Nokogiri::HTML(open("http://bleacherreport.com/nfl"))


    @headlines = {}

    @headlinesLinks = []
    @headlinesTitles = []
    doc.css('ol a')[1..10].each do |headline|
      link = headline.attribute('href').value
      title = headline.children[1].children.text.strip

      @headlines[title] = link

      @headlinesLinks << link
      @headlinesTitles << title
    end


  end

end
