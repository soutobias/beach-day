class Beach < ApplicationRecord
  has_many :real_time_values, dependent: :destroy
  has_many :weather_forecast_values, dependent: :destroy
  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :overview, length: { minimum: 10, maximum: 254 }
<<<<<<< HEAD
=======
  has_one_attached :photo
>>>>>>> 35f5b334c6fb1cbc167459f0fffb9f4e7f0b2c10
end
