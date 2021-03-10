class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
  end
  
  def new
    @reservation = Reservation.new
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
    if @reservation.invalid?
      render("rooms/#{@room}.id")
    end
  end
  
  def create
    @reservation = Reservation(reservation_params)
    if @reservation.save
      redirect_to(:reservation)
    end
  end
  
  def show
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  
  end
  
  
  private
  
  def reservation_params
    params.require(:reservation).permit(:start_at, :end_at, :purson_num, :room_id)
  end
  
end
