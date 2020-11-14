class Review < ApplicationRecord
  belongs_to :beach
  validates :content, :parking, :restaurant, :public_transportation, :security, :cleaning, :rent_equipment, :wave,
  :wind, :accessibility, :sand_strip, presence: true
  validates :parking, :restaurant, :public_transportation, :security, :cleaning, :rent_equipment, :wave, :wind,
  :accessibility, :sand_strip, numericality: { only_integer: true }
  validates_inclusion_of :parking, :restaurant, :public_transportation, :security, :cleaning, :rent_equipment, :wave,
  :wind, :accessibility, :sand_strip, in: 0..10
end
