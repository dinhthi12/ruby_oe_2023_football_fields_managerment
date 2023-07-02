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

  def bill
    byebug
    if pitch_booking_params[:time_end] || pitch_booking_params[:time_start].nil?
      return 0
    end

    @total =
      (pitch_booking_params[:time_end].to_time -
         pitch_booking_params[:time_start].to_time) *
      200_000 / 3600 + total_services
  end

  def total_services
    return 0 if pitch_booking_params[:pitch_booking_services_attributes].nil?

    pitch_booking_params[:pitch_booking_services_attributes].each.sum do |_, v|
      v[:number].to_i * 10_000
    end
  end

  def pitch_booking_params
    byebug
    params.require(:pitch_booking).permit(PitchBooking::PARAMS).merge(
      pitch_id: params[:pitch_id], total_price: bill
    )
  end
end
