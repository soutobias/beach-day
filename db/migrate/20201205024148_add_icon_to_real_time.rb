class AddIconToRealTime < ActiveRecord::Migration[6.0]
  def change
    add_column :real_time_values, :icon, :string
  end
end
