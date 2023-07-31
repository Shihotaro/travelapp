class CreateReservations < ActiveRecord::Migration[7.0]
  def change
    create_table :reservations do |t|
      t.references :rooms, null: false, foreign_key: true
      t.references :users, null: false, foreign_key: true
      t.date :checkin
      t.date :checkout
      t.integer :party

      t.timestamps
    end
  end
end
