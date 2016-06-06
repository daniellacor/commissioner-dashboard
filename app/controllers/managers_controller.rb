class ManagersController < ApplicationController
  def new
    @league = current_user.leagues.first
    @manager = Manager.new
  end

  def create
    manager = Manager.new(manager_params)
    if manager_params["name"].blank? || manager_params["email"].blank? || manager_params["phone_number"].blank?
    flash[:danger] = "You were missing attributes for manager"
    redirect_to :back
    else
    manager.league_id = params[:league_id]
    manager.save
    respond_to do |format|
      format.js
    end
    end
  end

private
  def manager_params
    params.require(:manager).permit(:name, :email, :phone_number)
  end
end
