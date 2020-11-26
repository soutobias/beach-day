class WaterForecastStation < ApplicationRecord
  has_many :water_forecast_values, dependent: :destroy
end
