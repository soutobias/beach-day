class RemoveColumnFromWeather < ActiveRecord::Migration[6.0]
  def change
    remove_column :weather_forecast_values, :wave_formation
  end
end
