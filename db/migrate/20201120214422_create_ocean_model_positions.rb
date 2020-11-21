class CreateOceanModelPositions < ActiveRecord::Migration[6.0]
  def change
    create_table :ocean_model_positions do |t|
      t.numeric :lat
      t.numeric :lng

      t.timestamps
    end
  end
end
