class HomeController < ApplicationController
  def index
    @commissioner = Commissioner.new
  end
end
