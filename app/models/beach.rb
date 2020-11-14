class Beach < ApplicationRecord
  has_many :real_time_values, dependent: :destroy
  has_many :weather_forecast_values, dependent: :destroy
end
