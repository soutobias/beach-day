class CleaningStation < ApplicationRecord
  has_many :cleaning_values, dependent: :destroy
end
