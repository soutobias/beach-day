class RemoveTitleFromReview < ActiveRecord::Migration[6.0]
  def change
    remove_column :reviews, :title, :text
  end
end
