class PitchBooking < ApplicationRecord
  PARAMS = [:user_id, :time_start,
    :time_end, :status,
    :des, :phone, :name,
    {pitch_booking_services_attributes: %i(
      service_id number _destroy
    )}].freeze
  belongs_to :user
  belongs_to :pitch
  has_many :pitch_booking_services, dependent: :destroy
  has_many :services, through: :pitch_booking_services
  accepts_nested_attributes_for :pitch_booking_services, allow_destroy: true

  validates :time_start, presence: true
  validates :time_end, presence: true
  validates :name, presence: true,
                   length: {minimum: Settings.digits.length_10,
                            maximum: Settings.digits.length_30}
  validates :phone, presence: true,
                    format: {with: Settings.user.phone.regex}


end
