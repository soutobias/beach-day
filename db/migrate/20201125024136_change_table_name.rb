class ChangeTableName < ActiveRecord::Migration[6.0]
  def change
    rename_table :ocean_model_positions, :water_forecast_stations
  end
end
