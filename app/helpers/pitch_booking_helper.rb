module PitchBookingHelper
  def pitch_booking_status_options
    PitchBooking.statuses.except(:pending).map do |key, value|
      [I18n.t("pitch_booking.statuses.#{key}"), value]
    end
  end
end
