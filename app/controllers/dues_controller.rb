class DuesController < ApplicationController

  def index
    @dues = current_user.leagues.first.dues
    @managers = current_user.leagues.first.managers
    @league = current_user.leagues.first
    @headlines = Headlines.get_headlines
  end

  def new
    @due = Due.new
    @league = current_user.leagues.first
    @headlines = Headlines.get_headlines
  end

  def create
    commish_due = Due.new(due_params)
    commish_due.commissioner_id = current_user.id
    commish_due.league_id = params[:league_id]
    commish_due.save

    @league = League.find(params[:league_id])
    @league.managers.each do |manager|
      due = Due.new(due_params)
      due.manager_id = manager.id
      due.league_id = params[:league_id]
      due.save
    end
    redirect_to league_dues_path(@league)
  end

  def edit

  end

  def update
    @due = Due.find(params[:id])
  end

  def show
    @due = Due.find(params[:id])
    @headlines = Headlines.get_headlines
  end

  def destroy
  end

  def pay
    @league = current_user.leagues.first
    @managers = current_user.leagues.first.managers
    @due = Due.find_by(id: params[:id])
    @due.paid = true
    @due.save
    respond_to do |format|
      format.js
    end
  end

  private

  def due_params
    params.require(:due).permit(:amount)
  end

end
