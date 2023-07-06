class PitchBookingController < ApplicationController
  before_action :require_login

  def new
    @pitch_booking = PitchBooking.new
    @pitch_booking.services.build
    @services = Service.all
  end

  def create
    @services = Service.all
    @pitch_booking = current_user
                     .pitch_bookings
                     .build(pitch_booking_params)
    if check_booking_exists? && @pitch_booking.save
      flash[:success] = t "notification.success"
      redirect_to root_path
    else
      flash.now[:error] = t "notification.err"
      render :new
    end
  end

  private

  def require_login
    return if logged_in?

    flash[:warning] = t "notification.notlogin"
    redirect_to login_path
  end

  def pitch_booking_params
    params.require(:pitch_booking).permit(PitchBooking::PARAMS).merge(
      pitch_id: params[:pitch_id]
    )
  end

  def check_booking_exists?
    total = @pitch_booking.pitch.pitch_bookings
    total.each do |pitch_booking|
      if check(pitch_booking)
        @pitch_booking.errors.add(:base, "invalid")
        return false
      end
    end
    true
  end

  def check pitch_booking
    timestart = Time.zone.parse(pitch_booking_params[:time_start]).to_i
    timeend = Time.zone.parse(pitch_booking_params[:time_end]).to_i
    timestart_pitch = pitch_booking.time_start.to_datetime.to_i
    timeend_pitch = pitch_booking.time_end.to_datetime.to_i

    (timestart...timeend).overlaps?(timestart_pitch...timeend_pitch)
  end
end
