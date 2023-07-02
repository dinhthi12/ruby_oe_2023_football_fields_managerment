class Pitch < ApplicationRecord
  has_one_attached :image

  has_many :pitch_bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :image, content_type: {in: %w(image/jpeg image/gif image/png),
                                   message: "must be a valid image format"},
                    size: {less_than: 5.megabytes,
                           message: "should be less than 5MB"}
  validates :pitch_type, :hour_price, presence: true,
  numericality: {only_integer: true}

  def display_image
    image.variant resize_to_limit: Settings.image.resize_to_limit
  end
end
