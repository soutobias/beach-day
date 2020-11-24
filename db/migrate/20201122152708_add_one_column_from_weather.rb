class AddOneColumnFromWeather < ActiveRecord::Migration[6.0]
  def change
    add_column :weather_forecast_dailies, :icon, :string
    add_column :weather_forecast_values, :icon, :string
  end
end
