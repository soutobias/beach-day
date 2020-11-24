class RealTimeValue < ApplicationRecord
  belongs_to :beach
  validates :date_time, presence: true, allow_nil: true
  validates_inclusion_of :wave_direction, in: %w(Norte Nordeste Leste Sudeste Sul Sul-Sudeste Sudoeste Oeste Noroeste), allow_nil:true
  validates :wave_height, numericality: true, allow_nil: true
  validates_inclusion_of :wave_height, in: 0..10, allow_nil:true
  validates_inclusion_of :wind_direction, in: %w(Norte Nordeste Leste Sudeste Sul Sul-Sudeste Sudoeste Oeste Noroeste), allow_nil:true
  validates :wind_speed, numericality: true, allow_nil: true
  validates_inclusion_of :wind_speed, in: 0..60
  validates :water_temperature, numericality: true, allow_nil: true
  validates_inclusion_of :water_temperature, in: 0..40, allow_nil:true
  validates :air_temperature, numericality: true, allow_nil: true
  validates_inclusion_of :air_temperature, in: 0..50
  validates :humidity, numericality: { only_integer: true }, allow_nil: true
  validates_inclusion_of :humidity, in: 0..100
  validates :pressure, numericality: true, allow_nil: true
  validates_inclusion_of :pressure, in: 900..1200
  validates :tide, numericality: true, allow_nil: true
  validates_inclusion_of :tide_situation, in: ["baixa", "alta", "subindo", "descendo"]
end
