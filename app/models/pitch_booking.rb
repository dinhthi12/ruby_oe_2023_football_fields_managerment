class PitchBooking < ApplicationRecord
  belongs_to :user
  belongs_to :pitch
  has_many :pitch_booking_services, dependent: :destroy
  has_many :services, through: :pitch_booking_services
  accepts_nested_attributes_for :pitch_booking_services, allow_destroy: true
end
