class DuesController < ApplicationController

  def new
    @due = Due.new
    @league = current_user.leagues.first
  end

  def create
    @due = Due.new(due_params)
    if due_params["account"].blank?
      flash[:danger] = "You need to specify your total league dues"
      redirect_to :back
    else
      @due.commissioner_id = current_user.id
      @due.league_id = current_user.league_id
      #   @commissioner.managers.each do |manager|
      #     manager.due.id = current_user.league_id
      #   end
      @due.save
      redirect_to league_due_path(@due)
    end
  end

  def edit

  end

  def update
  end

  def show
  end

  def destroy
  end

  private

  def due_params
    params.require(:due).permit(:amount)
  end

end
