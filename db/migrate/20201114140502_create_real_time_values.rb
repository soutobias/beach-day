class CreateRealTimeValues < ActiveRecord::Migration[6.0]
  def change
    create_table :real_time_values do |t|
      t.references :beach, null: false, foreign_key: true
      t.datetime :date_time
      t.numeric :wave_height
      t.string :wave_direction
      t.string :wave_formation
      t.numeric :wind_speed
      t.string :wind_direction
      t.string :rain
      t.integer :humidity
      t.numeric :pressure
      t.numeric :air_temperature
      t.numeric :water_temperature
      t.boolean :cleaning
      t.numeric :tide
      t.string :tide_situation

      t.timestamps
    end
  end
end
