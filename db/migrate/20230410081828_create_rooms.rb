class CreateRooms < ActiveRecord::Migration[7.0]
  def change
    create_table :rooms do |t|
      t.string :roomimg
      t.string :roomname
      t.text :roomaddress
      t.text :roomdetails
      t.integer :roomrate

      t.timestamps
    end
  end
end
