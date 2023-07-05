class PitchBookingController < ApplicationController
  def new
    @pitch_booking = PitchBooking.new
    @pitch_booking.services.build
    @services = Service.all
  end

  def index; end

  def create
    @services = Service.all
    @pitch_booking = current_user
                     .pitch_bookings
                     .build(pitch_booking_params)

    if @pitch_booking.save
      flash[:success] = t "notification.success"
      redirect_to root_path
    else
      flash.now[:error] = t "notification.err"
      render :new
    end
  end

  private

  def pitch_booking_params
    params.require(:pitch_booking).permit(PitchBooking::PARAMS).merge(
      pitch_id: params[:pitch_id]
    )
  end
end
