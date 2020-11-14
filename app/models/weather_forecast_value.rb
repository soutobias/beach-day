class WeatherForecastValue < ApplicationRecord
  belongs_to :beach
  validates :date_time, presence: true
  validates_inclusion_of :wave_direction, in: %w(norte nordeste leste sudeste sul sudoeste oeste noroeste)
  validates :wave_height, numericality: true
  validates_inclusion_of :wave_height, in: 0..10
  validates :rain, numericality: true
  validates_inclusion_of :rain, in: 0..200
  validates :rain_probability, numericality: { only_integer: true }
  validates_inclusion_of :rain_probability, in: 0..100
  validates_inclusion_of :wind_direction, in: %w(norte nordeste leste sudeste sul sudoeste oeste noroeste)
  validates :wind_speed, numericality: true
  validates_inclusion_of :wind_speed, in: 0..60
  validates :water_temperature, numericality: true
  validates_inclusion_of :water_temperature, in: 0..40
  validates :air_temperature, numericality: true
  validates_inclusion_of :air_temperature, in: 0..50
  validates :humidity, numericality: { only_integer: true }
  validates_inclusion_of :humidity, in: 0..100
  validates :pressure, numericality: true
  validates_inclusion_of :pressure, in: 900..1200
end
