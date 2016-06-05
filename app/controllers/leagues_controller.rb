class LeaguesController < ApplicationController
  def new
    @league = League.new
  end

  def create
    @league = League.new(league_params)
    if league_params["name"].blank?
      flash[:danger] = "You need to give a name for your league"
      redirect_to :back
    else
      @league.commissioner_id = current_user.id
      @league.save
      redirect_to league_path(@league)
    end
  end

  def show
    @league = current_user.leagues.first
  end

private

  def league_params
    params.require(:league).permit(:name)
  end

end
