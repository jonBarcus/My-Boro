class CreateFavoritesUsers < ActiveRecord::Migration
  def change
    create_table :favorites_users do |t|
      t.integer :user_id
      t.integer :favorite_id
    end
  end
end
