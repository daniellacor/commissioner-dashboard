class HeadlinesController < ApplicationController

  def index
    @league = current_user.leagues.first
    require 'open-uri'
    doc = Nokogiri::HTML(open("http://bleacherreport.com/nfl"))
    doc_ir = Nokogiri::HTML(open("http://espn.go.com/nfl/injuries"))

    @headlines = {}
    @injuries = []

    doc.css('ol a')[1..30].each do |headline|
      link = headline.attribute('href').value
      title = headline.children[1].children.text.strip
      @headlines[title] = link
    end


    doc_ir.css('.tablehead td')[1..100].each do |player|
      player = player.text
      @injuries << player
    end


  end



end
