class CreateWaveForecastStations < ActiveRecord::Migration[6.0]
  def change
    create_table :wave_forecast_stations do |t|
      t.numeric :lat
      t.numeric :lng
      t.string :url

      t.timestamps
    end
  end
end
