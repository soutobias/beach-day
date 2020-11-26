class DropStorm < ActiveRecord::Migration[6.0]
  def change
    drop_table :storms
    drop_table :weather_values
    drop_table :weather_stations
    drop_table :weather_warnings
  end
end
