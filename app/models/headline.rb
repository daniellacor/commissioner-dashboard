require 'nokogiri'
require 'open-uri'

class Headline < ActiveRecord::Base

  attr_accessor :title, :link

  def initialize(title, link)
    @title = title
    @link = link
  end


end
