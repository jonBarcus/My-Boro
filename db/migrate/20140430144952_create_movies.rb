class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.integer    :user_id
      t.string      :theater
      t.string      :address
      t.string      :title
      t.timestamps
    end
  end
end
