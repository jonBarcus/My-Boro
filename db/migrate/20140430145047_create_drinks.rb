class CreateDrinks < ActiveRecord::Migration
  def change
    create_table :drinks do |t|
      t.integer :user_id
      t.string :name
      t.string :address
      t.string :rating
      t.timestamps

    end
  end
end
