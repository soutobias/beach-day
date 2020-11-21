class CreateForecasts < ActiveRecord::Migration[6.0]
  def change
    create_table :forecasts do |t|
      t.integer :station
      t.numeric :lat
      t.numeric :lng

      t.timestamps
    end
  end
end
