class PitchBookingController < ApplicationController
  before_action :require_login

  def new; end

  private

  def require_login
    return if logged_in?

    flash[:warning] = t "notification.notlogin"
    redirect_to login_path
  end
end
