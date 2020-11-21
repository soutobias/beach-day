class AddColumnToVisualValues < ActiveRecord::Migration[6.0]
  def change
    add_column :visual_values, :date_time, :datetime
  end
end
