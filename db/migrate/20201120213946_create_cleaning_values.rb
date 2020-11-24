class CreateCleaningValues < ActiveRecord::Migration[6.0]
  def change
    create_table :cleaning_values do |t|
      t.references :cleaning_station, null: false, foreign_key: true
      t.datetime :date_time
      t.string :status

      t.timestamps
    end
  end
end
