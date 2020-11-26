class ChangeOtherTableName < ActiveRecord::Migration[6.0]
  def change
    rename_table :ocean_model_values, :water_forecast_values
  end
end
