class DefaultZeroAtBeaches < ActiveRecord::Migration[6.0]
  def change
    change_column_default :beaches, :overall_parking, 0
    change_column_default :beaches, :overall_restaurant, 0
    change_column_default :beaches, :overall_public_transportation, 0
    change_column_default :beaches, :overall_security, 0
    change_column_default :beaches, :overall_cleaning, 0
    change_column_default :beaches, :overall_rent_equipment, 0
    change_column_default :beaches, :overall_wave, 0
    change_column_default :beaches, :overall_wind, 0
    change_column_default :beaches, :overall_accessibility, 0
    change_column_default :beaches, :overall_sand_strip, 0
    change_column_default :beaches, :overall_rating, 0
  end
end
