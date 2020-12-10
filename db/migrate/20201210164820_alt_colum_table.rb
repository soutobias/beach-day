class AltColumTable < ActiveRecord::Migration[6.0]
  def change
    change_column :weather_forecast_values, :rain_probability, :numeric
  end
end
