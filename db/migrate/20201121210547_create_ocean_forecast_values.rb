class CreateOceanForecastValues < ActiveRecord::Migration[6.0]
  def change
    create_table :ocean_forecast_values do |t|
      t.datetime :date_time
      t.numeric :water_temperature
      t.numeric :wave_height
      t.integer :wave_formation
      t.integer :wave_direction
      t.references :beach, null: false, foreign_key: true

      t.timestamps
    end
  end
end
