class Beach < ApplicationRecord
  has_many :real_time_values, dependent: :destroy
  has_many :weather_forecast_values, dependent: :destroy
  has_many :reviews, dependent: :destroy

  validates :name, presence: true, uniqueness: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :overall_rating, numericality: true, inclusion: { in: 0..10, message: 'Value should be between 0 and 10' }
  validates :overview, length: { minimum: 10, maximum: 254 }
end
