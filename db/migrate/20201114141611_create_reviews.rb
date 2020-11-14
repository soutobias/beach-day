class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.text :content
      t.integer :parking
      t.integer :restaurant
      t.integer :public_transportation
      t.integer :security
      t.integer :cleaning
      t.integer :rent_equipment
      t.integer :wave
      t.integer :wind
      t.integer :accessibility
      t.integer :sand_strip
      t.references :beach, null: false, foreign_key: true

      t.timestamps
    end
  end
end
