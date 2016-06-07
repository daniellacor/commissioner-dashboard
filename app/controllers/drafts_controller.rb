class DraftsController < ApplicationController

  def index
    @league = current_user.leagues.first
  end


end
