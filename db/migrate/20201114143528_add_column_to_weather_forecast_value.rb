class AddColumnToWeatherForecastValue < ActiveRecord::Migration[6.0]
  def change
    add_column :weather_forecast_values, :description, :string
    add_column :weather_forecast_values, :wave_formation, :string
  end
end
