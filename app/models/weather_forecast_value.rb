class WeatherForecastValue < ApplicationRecord
  belongs_to :beach
  validates :date_time, presence: true, allow_nil: true
  validates_inclusion_of :wave_direction, in: %w(Norte Nordeste Leste Sudeste Sul Sul-Sudeste Sudoeste Oeste Noroeste), allow_nil:true
  validates :wave_height, numericality: true, allow_nil: true
  validates_inclusion_of :wave_height, in: 0..10, allow_nil: true
  validates :rain, numericality: true, allow_nil: true
  validates_inclusion_of :rain, in: 0..200, allow_nil: true
  validates_inclusion_of :wind_direction, in: %w(Norte Nordeste Leste Sudeste Sul Sul-Sudeste Sudoeste Oeste Noroeste), allow_nil:true
  validates :wind_speed, numericality: true, allow_nil: true
  validates_inclusion_of :wind_speed, in: 0..60, allow_nil: true
  validates :water_temperature, numericality: true, allow_nil: true
  validates_inclusion_of :water_temperature, in: 0..40, allow_nil: true
  validates :air_temperature, numericality: true, allow_nil: true
  validates_inclusion_of :air_temperature, in: 0..50, allow_nil: true
end

