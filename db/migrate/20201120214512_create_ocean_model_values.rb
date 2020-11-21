class CreateOceanModelValues < ActiveRecord::Migration[6.0]
  def change
    create_table :ocean_model_values do |t|
      t.references :ocean_model_position, null: false, foreign_key: true
      t.datetime :date_time
      t.numeric :water_temperature

      t.timestamps
    end
  end
end
