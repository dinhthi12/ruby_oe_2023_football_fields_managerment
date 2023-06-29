class Service < ApplicationRecord
  has_many :pitch_booking_services, dependent: :destroy
  has_many :pitch_bookings, through: :pitch_booking_services
end
