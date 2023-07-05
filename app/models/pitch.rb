class Pitch < ApplicationRecord
  has_one_attached :image

  has_many :pitch_bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, presence: true
  validates :image, content_type: {in: %w(image/jpeg image/gif image/png),
                                   message: :valid_format},
                    size: {less_than: 5.megabytes,
                           message: :should_less_than}
  validates :pitch_type, :hour_price, presence: true,
  numericality: {only_integer: true}

  scope :sort_list_pitch, ->{order :name}

  scope :search_text, lambda {|query|
                        where(
                          "name LIKE :search OR hour_price LIKE :search OR rate
                          LIKE :search OR
       pitch_type LIKE :search",
                          search: "%#{query}%"
                        )
                      }

  def display_image
    image.variant resize_to_limit: Settings.image.resize_to_limit
  end
end
