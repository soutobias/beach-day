class BuoyStation < ApplicationRecord
  has_many :buoy_values, dependent: :destroy
end
