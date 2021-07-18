class AddColumnReservation < ActiveRecord::Migration[6.1]
  def change
    add_column :reservations, :reservation_name, :string
    add_column :reservations, :reservation_image, :string
    add_column :reservations, :reservation_introduction, :text
    
  end
end
