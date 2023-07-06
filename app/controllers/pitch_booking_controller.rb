class PitchBookingController < ApplicationController
  before_action :require_login

  def new
    @pitch_booking = PitchBooking.new
    @pitch_booking.services.build
    @services = Service.all
  end

  private

  def require_login
    return if logged_in?

    flash[:warning] = t "notification.notlogin"
    redirect_to login_path
  end
end
