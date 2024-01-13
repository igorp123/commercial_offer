class User < ApplicationRecord
  attr_accessor :old_password

  has_secure_password validations: false

  validate :correct_old_password, on: :update

  validate :password_presence

  validates :password, confirmation: true, allow_blank: true #,length: {minimum: 8, maximum: 70}

  validates :email, presence: true, uniqueness: true

  private

  def correct_old_password
    return if BCrypt::Password.new(password_digest_was).is_password?(old_password)

    errors.add(:old_password, 'is incorrect')
  end

  def password_presence
    errors.add(:password, :blank) unless password_digest.present?
  end
end
