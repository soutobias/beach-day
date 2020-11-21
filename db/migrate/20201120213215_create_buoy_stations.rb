class CreateBuoyStations < ActiveRecord::Migration[6.0]
  def change
    create_table :buoy_stations do |t|
      t.decimal :lat
      t.decimal :lng

      t.timestamps
    end
  end
end
