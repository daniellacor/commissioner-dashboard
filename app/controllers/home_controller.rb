class HomeController < ApplicationController
  def index
  end

  def back
    respond_to do |format|
      format.js
    end
  end
end
