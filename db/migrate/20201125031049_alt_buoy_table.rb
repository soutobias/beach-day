class AltBuoyTable < ActiveRecord::Migration[6.0]
  def change
    rename_table :buoys, :buoy_values
    add_reference :water_forecast_values, :water_forecast_station, index: true
  end
end
