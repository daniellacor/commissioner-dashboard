class LeaguesController < ApplicationController
  def new
    @league = League.new
    @headlines = Headlines.get_headlines
  end

  def write_email
    @league = current_user.leagues.first
    @managers = current_user.leagues.first.managers
    @league = current_user.leagues.first
    @headlines = Headlines.get_headlines
    respond_to do |format|
      format.js
    end
  end

  def send_email
    @league = League.find_by(id: params[:id])
    @managers = @league.managers
    @subject = params[:subject]
    @content = params[:content]
    @manager_emails = @managers.map {|manager| manager.email}
    @commissioner = current_user
    UserMailer.league(@manager_emails, @commissioner, @subject, @content).deliver_now
    respond_to do |format|
      format.js
    end
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
    @headlines = Headlines.get_headlines
  end

  def show
    @league = current_user.leagues.first
    @headlines = Headlines.get_headlines
  end

private

  def league_params
    params.require(:league).permit(:name)
  end

end
