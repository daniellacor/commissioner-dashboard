class ManagersController < ApplicationController
  def new
    @league = current_user.leagues.first
    @manager = Manager.new
  end

  def create
    manager = Manager.new(manager_params)
    manager.league_id = params[:league_id]
    manager.save
    redirect_to new_league_manager_path(manager.league)
  end

private
  def manager_params
    params.require(:manager).permit(:name, :email, :phone_number)
  end
end
