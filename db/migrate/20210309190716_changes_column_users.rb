class ChangesColumnUsers < ActiveRecord::Migration[6.1]
  def change
    add_column :users, :user_image, :string
    remove_column :users, :image_name, :string
    add_column :rooms, :room_image, :string
    remove_column :rooms, :room_image_name, :string
  end
end
