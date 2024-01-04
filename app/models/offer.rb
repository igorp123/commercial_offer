class Offer < ApplicationRecord
  validates :client, presence: true, length: {minimum: 2}
  validates :body, presence: true, length: {minimum: 2}

  def formatted_created_at
    created_at.strftime('%d.%m.%Y %H:%M')
  end
end
