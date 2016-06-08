class HeadlinesController < ApplicationController

  def index
    @league = current_user.leagues.first
    require 'open-uri'
    doc = Nokogiri::HTML(open("http://bleacherreport.com/nfl"))
    doc_ir = Nokogiri::HTML(open("http://espn.go.com/nfl/injuries"))

    @headlines = {}
    @injur_stat = {}

    doc.css('ol a')[1..30].each do |headline|
      link = headline.attribute('href').value
      title = headline.children[1].children.text.strip
      @headlines[title] = link
    end


    doc_ir.css('.tablehead .oddrow')[0..100].each do |player|
      injured = player.children.children.children.text
      status = player.children.children[2]
      @injur_stat[injured] = status
    end
  end



end
