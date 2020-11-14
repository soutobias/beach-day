class CreateWeatherForecastValues < ActiveRecord::Migration[6.0]
  def change
    create_table :weather_forecast_values do |t|
      t.references :beach, null: false, foreign_key: true
      t.datetime :date_time
      t.string :wave_direction
      t.numeric :wave_height
      t.integer :rain
      t.integer :rain_probability
      t.string :wind_direction
      t.numeric :wind_speed
      t.numeric :water_temperature
      t.numeric :air_temperature

      t.timestamps
    end
  end
end
