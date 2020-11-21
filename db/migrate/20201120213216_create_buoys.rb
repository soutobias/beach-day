class CreateBuoys < ActiveRecord::Migration[6.0]
  def change
    create_table :buoys do |t|
      t.references :buoy_station, null: false, foreign_key: true
      t.datetime :date_time
      t.decimal :pressure
      t.decimal :air_temperature
      t.decimal :humidity
      t.decimal :wind_speed
      t.decimal :wind_dir
      t.decimal :wave_height
      t.decimal :wave_formation
      t.decimal :wave_direction
      t.decimal :water_temperature

      t.timestamps
    end
  end
end
