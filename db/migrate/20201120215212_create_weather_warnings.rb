class CreateWeatherWarnings < ActiveRecord::Migration[6.0]
  def change
    create_table :weather_warnings do |t|
      t.string :event
      t.datetime :start_date
      t.datetime :end_date

      t.timestamps
    end
  end
end
