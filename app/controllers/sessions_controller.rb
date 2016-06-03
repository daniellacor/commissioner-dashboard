class SessionsController < ApplicationController


  def new
  end

  def create
    commissioner = Commissioner.find(email: params[:email])

    if commissioner && commissioner.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to "/"
    else
      redirect_to '/login'
  end

  def destroy
    session[:user_id] = nil
    direct_to '/'
  end


end
