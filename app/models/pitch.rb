class Pitch < ApplicationRecord
  has_many :pitch_bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
