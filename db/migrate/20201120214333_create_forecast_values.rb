class CreateForecastValues < ActiveRecord::Migration[6.0]
  def change
    create_table :forecast_values do |t|
      t.references :forecast, null: false, foreign_key: true
      t.datetime :date_time
      t.integer :wind_speed
      t.integer :wind_direction
      t.numeric :wave_height
      t.integer :wave_formation
      t.integer :wave_direction
      t.integer :air_temperature
      t.decimal :rain

      t.timestamps
    end
  end
end
