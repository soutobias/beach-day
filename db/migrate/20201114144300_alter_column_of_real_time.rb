class AlterColumnOfRealTime < ActiveRecord::Migration[6.0]
  def change
    add_column :real_time_values, :description, :string
  end
end
