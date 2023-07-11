module Admin::PitchBookingsHelper
  def pitch_booking_status_options
    PitchBooking.statuses.except(:pending).map do |key, _|
      [I18n.t("pitch_booking.statuses.#{key}"), key]
    end
  end
end
