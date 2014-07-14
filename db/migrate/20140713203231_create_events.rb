class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.datetime :ended_at
      t.string :name, null: false
      t.integer :place_id, null: false
      t.datetime :started_at
      t.integer :user_id, null: false

      t.timestamps
    end

    add_index :events, :place_id
    add_index :events, :user_id
  end
end
