class CreateWaveForecastValues < ActiveRecord::Migration[6.0]
  def change
    create_table :wave_forecast_values do |t|
      t.datetime :date_time
      t.numeric :wind_speed
      t.string :wind_direction
      t.string :wave_direction
      t.numeric :wave_height
      t.numeric :wave_formation
      t.references :wave_forecast_station, null: false, foreign_key: true

      t.timestamps
    end
  end
end
