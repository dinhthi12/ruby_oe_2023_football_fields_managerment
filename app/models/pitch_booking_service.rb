class PitchBookingService < ApplicationRecord
  belongs_to :pitch_booking
  belongs_to :service
end
