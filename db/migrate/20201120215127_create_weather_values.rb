class CreateWeatherValues < ActiveRecord::Migration[6.0]
  def change
    create_table :weather_values do |t|
      t.references :weather_station, null: false, foreign_key: true
      t.datetime :date_time
      t.numeric :air_temperature
      t.numeric :humidity
      t.numeric :pressure
      t.numeric :wind_speed
      t.numeric :wind_dir
      t.numeric :rain

      t.timestamps
    end
  end
end
