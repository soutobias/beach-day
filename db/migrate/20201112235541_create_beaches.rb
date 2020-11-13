class CreateBeaches < ActiveRecord::Migration[6.0]
  def change
    create_table :beaches do |t|
      t.string :name
      t.decimal :lat
      t.decimal :lng
      t.decimal :overall_rating

      t.timestamps
    end
  end
end
