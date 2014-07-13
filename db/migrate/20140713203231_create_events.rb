class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.string :venue
      t.datetime :date

      t.timestamps
    end
  end
end
