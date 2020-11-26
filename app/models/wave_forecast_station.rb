class WaveForecastStation < ApplicationRecord
  has_many :wave_forecast_values, dependent: :destroy
end
