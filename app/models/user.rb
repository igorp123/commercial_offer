class User < ApplicationRecord
  attr_accessor :old_password

  has_secure_password

  validates :email, presence: true, uniqueness: true
end
