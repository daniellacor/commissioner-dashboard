class DraftsController < ApplicationController

  include DraftHelper

  def index
    @league = current_user.leagues.first
    @headlines = Headlines.get_headlines

    @date = params[:date] ? Date.parse(params[:date]) : Date.today

  end


end
