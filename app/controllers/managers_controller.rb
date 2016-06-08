class ManagersController < ApplicationController
  def index
    @league = current_user.leagues.first
    @managers = current_user.leagues.first.managers
    @headlines = Headlines.get_headlines
  end

  def write_text
    @league = current_user.leagues.first
    @manager = Manager.find_by(id: params[:id])
    respond_to do |format|
      format.js
    end
  end

  def send_text
    @manager = Manager.find_by(id: params[:id])
    number = @manager.phone_number
    @message = params[:message]
    twilio_token = ENV["TWILIO_TOKEN"]
    twilio_sid = ENV["TWILIO_SID"]
    twilio_phone_number = ENV["TWILIO_PHONE_NUMBER"]

    @twilio_client = Twilio::REST::Client.new twilio_sid, twilio_token
    @twilio_client.messages.create(
      :from => "+1#{twilio_phone_number}",
      :to => number,
      :body => "#{@message}"
    )
    respond_to do |format|
      format.js
    end
  end

  def new
    @league = current_user.leagues.first
    @manager = Manager.new
    @headlines = Headlines.get_headlines
  end

  def edit
    @league = current_user.leagues.first
    @manager = Manager.find_by(id: params[:id])
    respond_to do |format|
      format.js
    end
  end

  def update
    @manager = Manager.find_by(id: params[:id])
    @manager = @manager.update(manager_params)
    @managers = current_user.leagues.first.managers
    @league = current_user.leagues.first
    respond_to do |format|
      format.js
    end
  end

  def prompt
    @manager = Manager.find_by(id: params[:id])
    @league = @manager.league
    respond_to do |format|
      format.js
    end
  end

  def write_email
    @manager = Manager.find_by(id: params[:id])
    @league = @manager.league
    respond_to do |format|
      format.js
    end
  end

  def send_email
    @subject = params[:subject]
    @content = params[:content]
    @manager = Manager.find_by(id: params[:id])
    @commissioner = current_user
    UserMailer.manager(@manager, @commissioner, @subject, @content).deliver_now
    respond_to do |format|
      format.js
    end
  end

  def destroy
    @manager = Manager.find_by(id: params[:id])
    @league = @manager.league
    @manager.destroy
    @league = current_user.leagues.first
    @managers = current_user.leagues.first.managers
    respond_to do |format|
      format.js
    end
  end

  def create
    @manager = Manager.new(manager_params)
    if manager_params["name"].blank? || manager_params["email"].blank? || manager_params["phone_number"].blank?
    flash[:danger] = "You were missing attributes for manager"
    redirect_to :back
    else
    @league = League.find_by(id: params[:league_id])
    end
    @manager.league_id = params[:league_id]
    @manager.save
    @commissioner = current_user
    UserMailer.welcome(@manager, @commissioner).deliver_now
    if current_user.due
    @manager.due = Due.create(amount: current_user.due.amount, manager_id: @manager.id, league_id: @league.id)
    end
    respond_to do |format|
      format.js
    end
  end

  def show
    @league = current_user.leagues.first
    @manager = Manager.find_by(id: params[:id])
    @headlines = Headlines.get_headlines
  end

private
  def manager_params
    params.require(:manager).permit(:name, :email, :phone_number)
  end
end
