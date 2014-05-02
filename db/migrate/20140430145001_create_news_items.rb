class CreateNewsItems < ActiveRecord::Migration
  def change
    create_table :news_items do |t|
      t.integer :user_id
      t.string      :headline
      t.string      :url
      t.timestamps
    end
  end
end
