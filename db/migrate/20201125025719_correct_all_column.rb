class CorrectAllColumn < ActiveRecord::Migration[6.0]
  def change
    change_column :buoys, :wave_direction, :string
    rename_column :buoys, :wind_dir, :wind_direction
    change_column :buoys, :wind_direction, :string
    remove_column :cleaning_values, :status
    add_column :cleaning_values, :status, :boolean
    change_column :ocean_forecast_values, :wave_direction, :string
    remove_column :visual_stations, :place
    rename_column :visual_values, :wave_dir, :wave_direction
    remove_column :water_forecast_values, :ocean_model_position_id
  end
end
