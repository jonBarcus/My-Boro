class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string      :name
      t.string      :email
      t.integer     :admin_status, default: 0
      t.string      :password_digest
      t.timestamps
    end
  end
end
