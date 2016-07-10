class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :uid
      t.string :provider
      t.string :fb_path
      t.string :name

      t.timestamps null: false
    end
  end
end
