class DraftsController < ApplicationController

  def index
    @league = current_user.leagues.first
    @headlines = Headlines.get_headlines
  end


end
