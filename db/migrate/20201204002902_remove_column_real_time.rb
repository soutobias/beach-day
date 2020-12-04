class RemoveColumnRealTime < ActiveRecord::Migration[6.0]
  def change
    remove_column :real_time_values, :tide
    remove_column :real_time_values, :tide_situation
  end
end
