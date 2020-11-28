class Beach < ApplicationRecord
  has_many :real_time_values, dependent: :destroy
  has_many :weather_forecast_values, dependent: :destroy
  has_many :weather_forecast_dailies, dependent: :destroy

  has_many :ocean_forecast_values, dependent: :destroy

  has_many :reviews, dependent: :destroy
  validates :name, presence: true, uniqueness: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :overview, length: { minimum: 10, maximum: 254 }

  has_one_attached :photo
end
