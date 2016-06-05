class SessionsController < ApplicationController


  def new
  end

  def create
    commissioner = Commissioner.find_by(email: params[:email])

    if commissioner && commissioner.authenticate(params[:password])
      session[:user_id] = commissioner.id
      redirect_to commissioner_path(commissioner)
    else
      redirect_to '/'
    end
  end

  def destroy
    session[:user_id] = nil
    direct_to '/'
  end


end
