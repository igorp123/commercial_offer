class Offer < ApplicationRecord
  validates :client, presence: true, length: {minimum: 2}
  validates :body, presence: true, length: {minimum: 2}
end
