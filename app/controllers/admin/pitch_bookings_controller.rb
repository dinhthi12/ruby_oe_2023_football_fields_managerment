class Admin::PitchBookingsController < Admin::BaseController
  before_action :find_pitch_booking, only: :update

  def index
    # @pagy, @pitch_bookings = pagy PitchBooking.all,
    #                               items: Settings.digits.pagy_10
    @pagy, @pitch_bookings = pagy PitchBooking.includes(:user, :pitch)
  end

  def show; end

  def update
    byebug
    if @pitch_booking.update(status: PitchBooking.statuses[:status])
      respond_to do |format|
        format.html{redirect_to admin_pitch_bookings_path}
        format.js # Xử lý khi yêu cầu AJAX
      end
    else
      render :edit
    end
  end

  private

  def find_pitch_booking
    @pitch_booking = PitchBooking.find_by(id: params[:id])
    return if @pitch_booking
  end

  def pitch_booking_params
    params.require(:pitch_booking).permit(:status)
  end
end
