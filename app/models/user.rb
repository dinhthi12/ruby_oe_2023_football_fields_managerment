class User < ApplicationRecord
  attr_accessor :remember_token

  enum role: {admin: 1, user: 0}

  has_many :pitch_bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, presence: true,
            length: {minimum: Settings.digits.length_10,
                     maximum: Settings.digits.length_30}

  validates :email, presence: true, uniqueness: true,
            format: {with: Settings.user.email.regex}

  validates :phone, presence: true,
            format: {with: Settings.user.phone.regex}

  validates :address,
            length: {minimum: Settings.digits.length_10,
                     maximum: Settings.digits.length_30}

  validates :password,
            format: {with: Settings.user.password.regex}

  scope :listUser, ->{User.where.not(role: 1)}

  has_secure_password

  class << self
    def User.digest string
      cost = if ActiveModel::SecurePassword.min_cost
               BCrypt::Engine::MIN_COST
             else
               BCrypt::Engine.cost
             end
      BCrypt::Password.create string, cost: cost
    end

    def new_token
      SecureRandom.urlsafe_base64
    end
  end

  def remember
    self.remember_token = User.new_token
    update_column :remember_digest, User.digest(remember_token)
  end

  def authenticated? remember_token
    return false unless remember_digest

    BCrypt::Password.new(remember_digest).is_password? remember_token
  end

  def forget
    update_column :remember_digest, nil
  end
end
