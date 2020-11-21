class CreateVisualStations < ActiveRecord::Migration[6.0]
  def change
    create_table :visual_stations do |t|
      t.numeric :lat
      t.numeric :lng
      t.text :url
      t.boolean :place

      t.timestamps
    end
  end
end
