class AddColumnToWeatherForecastValue1 < ActiveRecord::Migration[6.0]
  def change
    add_column :weather_forecast_values, :humidity, :integer
    add_column :weather_forecast_values, :pressure, :numeric
  end
end
