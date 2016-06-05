class DuesController < ApplicationController

  def new
    @due = Due.new
    @league = current_user.leagues.first
  end

  def create
    @due = Due.new(due_params)
    @due.commissioner_id = current_user.id
    @league = current_user.leagues.first
    @due.league_id = @league.id

    debugger

    @league.managers.each do |manager|
      @due.manager_id = manager.id
    end

    @due.save
    redirect_to league_due_path(@league, @due)
  end

  def edit

  end

  def update
  end

  def show
    @due = Due.find(params[:id])
  end

  def destroy
  end

  private

  def due_params
    params.require(:due).permit(:amount)
  end

end
