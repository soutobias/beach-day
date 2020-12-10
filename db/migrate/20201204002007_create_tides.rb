class CreateTides < ActiveRecord::Migration[6.0]
  def change
    create_table :tides do |t|
      t.datetime :date_time
      t.numeric :tide
      t.string :tide_situation

      t.timestamps
    end
  end
end
