class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by email: params.dig(:session, :email)&.downcase
    if user&.authenticate params.dig(:session, :password)
      login_success user
    else
      flash.now[:error] = t "notification.failed"
      render :new
    end
  end

  def destroy
    log_out if logged_in?
    flash[:success] = t "notification.success"

    redirect_to root_url
  end

  private

  def login_success user
    log_in user
    params[:session][:remember_me] == "1" ? remember(user) : forget(user)
    if user.admin?
      flash[:success] = t "notification.success"

      redirect_to admin_root_path
    else
      redirect_to root_path
    end
  end
end
