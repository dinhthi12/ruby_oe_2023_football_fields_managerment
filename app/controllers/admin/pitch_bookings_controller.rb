class Admin::PitchBookingsController < Admin::BaseController
  before_action :find_pitch_booking, only: :update

  def index
    @pagy, @pitch_bookings = pagy PitchBooking.includes(:user, :pitch)
  end

  def show; end

  def update
    if @pitch_booking.update(status: params[:status])
      respond_to do |format|
        format.html{redirect_to admin_pitch_bookings_path}
        format.js
      end
    else
      render :edit
    end
  end

  private

  def find_pitch_booking
    @pitch_booking = PitchBooking.find_by(id: params[:id])
    return if @pitch_booking

    flash[:error] = t "notification.notfound"
    redirect_to admin_root_path
  end
end
