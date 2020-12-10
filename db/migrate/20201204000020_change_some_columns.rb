class ChangeSomeColumns < ActiveRecord::Migration[6.0]
  def change
    remove_column :real_time_values, :rain
    add_column :real_time_values, :air_temperature_feels_like, :numeric
  end
end
