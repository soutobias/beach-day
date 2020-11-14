class Beach < ApplicationRecord
  has_many :reviews

  validates :name, presence: true, uniqueness: true
  validates :lat, presence: true
  validates :lng, presence: true
  validates :overall_rating, numericality: true, inclusion: {in: 0..10, message: 'Value should be between 0 and 10' }
end
