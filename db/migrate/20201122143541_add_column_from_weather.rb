class AddColumnFromWeather < ActiveRecord::Migration[6.0]
  def change
    add_column :weather_forecast_dailies, :air_temperature_min, :numeric
    add_column :weather_forecast_dailies, :air_temperature_max, :numeric
  end
end
