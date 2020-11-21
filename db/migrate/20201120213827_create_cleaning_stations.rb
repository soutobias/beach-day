class CreateCleaningStations < ActiveRecord::Migration[6.0]
  def change
    create_table :cleaning_stations do |t|
      t.string :name
      t.string :description
      t.numeric :lat
      t.numeric :lng

      t.timestamps
    end
  end
end
