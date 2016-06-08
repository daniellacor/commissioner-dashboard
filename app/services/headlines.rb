require 'open-uri'
class Headlines
  def self.get_headlines
    doc = Nokogiri::HTML(open("http://bleacherreport.com/nfl"))
    @headlines = {}
    doc.css('ol a')[1..10].each do |headline|
      link = headline.attribute('href').value
      title = headline.children[1].children.text.strip
      @headlines[title] = link
    end
    @headlines
  end

end
