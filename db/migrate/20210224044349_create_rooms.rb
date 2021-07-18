class CreateRooms < ActiveRecord::Migration[6.1]
  def change
    create_table :rooms do |t|
      t.string :room_name
      t.string :introduction
      t.integer :charge
      t.string :address
      t.string :room_image_name

      t.timestamps
    end
  end
end
