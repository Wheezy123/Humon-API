class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :facebook_id
      t.string :first_name
      t.string :image_url
      t.string :last_name
      t.string :email

      t.timestamps
    end

    add_index :users, :facebook_id
  end
end
