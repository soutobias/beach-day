class CreateWeatherStations < ActiveRecord::Migration[6.0]
  def change
    create_table :weather_stations do |t|
      t.string :name
      t.numeric :lat
      t.numeric :lng

      t.timestamps
    end
  end
end
