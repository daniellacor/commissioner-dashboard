class SessionsController < ApplicationController


  def new
    respond_to do |format|
      format.js
    end
  end

  def create
    commissioner = Commissioner.find_by(email: params[:email])

    if commissioner && commissioner.authenticate(params[:password])
      session[:user_id] = commissioner.id
      redirect_to league_path(commissioner.leagues.first)
    else
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/'
  end


end
