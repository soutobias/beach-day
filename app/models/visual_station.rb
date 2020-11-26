class VisualStation < ApplicationRecord
  has_many :visual_values, dependent: :destroy
end
