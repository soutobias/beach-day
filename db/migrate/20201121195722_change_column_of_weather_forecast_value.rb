class ChangeColumnOfWeatherForecastValue < ActiveRecord::Migration[6.0]
  def change
    add_column :weather_forecast_values, :air_temperature_feels_like, :numeric
    remove_column :weather_forecast_values, :wave_height
    remove_column :weather_forecast_values, :wave_direction
    remove_column :weather_forecast_values, :water_temperature
    change_column :weather_forecast_values, :humidity, :numeric
    remove_column :weather_forecast_values, :rain
  end
end
