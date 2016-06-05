class ManagersController < ApplicationController
  def new
    @league = current_user.leagues.first
    @manager = Manager.new
  end
end
