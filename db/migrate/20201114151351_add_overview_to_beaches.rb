class AddOverviewToBeaches < ActiveRecord::Migration[6.0]
  def change
    add_column :beaches, :overview, :text
  end
end
