module SessionsHelper

  def sign_in(commissioner)
    remember_token = Commissioner.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    comissioner.update_attribute(:remember_token, Commissioner.encrypt(remember_token))
    self.current_user = comissioner
  end

  def current_user=(comissioner)
    @current_user = comissioner
  end

  def current_user
    remember_token = Commissioner.encrypt(cookies[:remember_token])
    @current_user ||= Commissioner.find_by(remember_token: remember_token)
  end

  def signed_in?
    !current_user.nil?
  end

  def sign_out
    current_user.update_attribute(:remember_token, Commissioner.encrypt(Commissioner.new_remember_token))
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def current_user?(commissioner)
    commissioner == current_user
  end

  def signed_in_user
    unless signed_in?
      flash[:warning] = "Please sign in"
      redirect_to signin_in_path
    end
  end

  def correct_user
    @commissioner = Commissioner.find(params[:id])
    redirect_to(comissioner_path(current_user)) unless current_user?(@commissioner)
  end

end
