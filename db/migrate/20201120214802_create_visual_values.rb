class CreateVisualValues < ActiveRecord::Migration[6.0]
  def change
    create_table :visual_values do |t|
      t.numeric :wave_height
      t.string :wave_formation
      t.string :wave_dir
      t.numeric :water_temperature
      t.references :visual_station, null: false, foreign_key: true

      t.timestamps
    end
  end
end
