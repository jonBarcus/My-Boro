class CreateFavorites < ActiveRecord::Migration
  def change
    create_table :favorites do |t|
      t.string :name
      t.string :url
      t.integer :category_id
    end
  end
end
