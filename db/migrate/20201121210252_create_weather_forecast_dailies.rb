class CreateWeatherForecastDailies < ActiveRecord::Migration[6.0]
  def change
    create_table :weather_forecast_dailies do |t|
      t.datetime :date_time
      t.numeric :wind_speed
      t.string :wind_direction
      t.numeric :rain_probability
      t.string :description
      t.numeric :air_temperature
      t.numeric :air_temperature_feels_like
      t.numeric :pressure
      t.numeric :humidity
      t.numeric :uv
      t.references :beach, null: false, foreign_key: true

      t.timestamps
    end
  end
end
