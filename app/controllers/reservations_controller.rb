class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
  end
  
  def new
    @reservation = Reservation.new
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
    render room_path if @reservation.invalid?
  end
  
  def create
    @reservation = Reservation(reservation_params)
    render room_path and return if params[:back] || !@reservation.save
    redirect_to @reservation
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
