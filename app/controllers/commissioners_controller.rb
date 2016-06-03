class CommissionersController < ApplicationController

  def show
    @commissioner = Commissioner.find(params[:id])
  end

  def new
    @commissioner = Commissioner.new
  end

  def create
    @commissioner = Commissioner.find(params[:id])
    @commissioner = Commissioner.create(commissioner_params)
    if commissioner.save
      session[:user_id] = @commissioner.id
      flash[:success] = "Welcome #{@commissioner.name}"
      redirect_to commissioner_path(@commissioner)
    else
      string = ""
      @commissioner.errors.full_messages.each {|error| string << "#{error}.<br>"}
      render 'new'
    end
  end

  def edit
    @commissioner = Commissioner.find(params[:id])
  end

  def update
    @commissioner = Commissioner.find(params[:id])
    @commissioner.update(commissioner_params)
    redirect_to commissioner_path(@commissioner)
  end

  private

  def commissioner_params
    params.require(:commissioner).permit(:name, :email, :phone_number, :password)
  end
end
