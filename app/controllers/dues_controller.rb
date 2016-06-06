class DuesController < ApplicationController

  def new
    @due = Due.new
    @league = current_user.leagues.first
  end

  def create
    @due = Due.new(due_params)
    @due.commissioner_id = current_user.id
    @due.league_id = params[:league_id]
    @due.save

    @league = League.find(params[:league_id])
    @league.managers.each do |manager|
      @due = Due.new(due_params)
      @due.manager_id = manager.id
      @due.league_id = params[:league_id]
      @due.save
    end

    redirect_to league_due_path(@league, @due)
  end

  def edit

  end

  def update
    @due = Due.find(params[:id])
  end

  def show
    @due = Due.find(params[:id])
  end

  def destroy
  end

  def pay
    @due = Due.find(params[:id])
    @due.paid = true
  end

  private

  def due_params
    params.require(:due).permit(:amount)
  end

end
