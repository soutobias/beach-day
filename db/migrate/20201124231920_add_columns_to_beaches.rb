class AddColumnsToBeaches < ActiveRecord::Migration[6.0]
  def change
    add_column :beaches, :overall_parking, :numeric
    add_column :beaches, :overall_restaurant, :numeric
    add_column :beaches, :overall_public_transportation, :numeric
    add_column :beaches, :overall_security, :numeric
    add_column :beaches, :overall_cleaning, :numeric
    add_column :beaches, :overall_rent_equipment, :numeric
    add_column :beaches, :overall_wave, :numeric
    add_column :beaches, :overall_wind, :numeric
    add_column :beaches, :overall_accessibility, :numeric
    add_column :beaches, :overall_sand_strip, :numeric
  end
end
