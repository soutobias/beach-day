class RemoveColumnOfWaveForecastValue < ActiveRecord::Migration[6.0]
  def change
    remove_column :wave_forecast_values, :wind_direction
    remove_column :wave_forecast_values, :wind_speed
    remove_column :wave_forecast_values, :wave_formation
  end
end
