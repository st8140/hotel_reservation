class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
  end
  
  def new
    @room = Room.find(params[:id])
    @reservation = Reservation.new
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find_by(params[:id])
    @day = (@reservation.end_date - @reservation.start_date).to_i
    @total =  (@day * @room.charge) * @reservation.purson_num
    @reservation.total = @total
    
  end
  
  def create
    @room = Room.find_by(params[:id])
    @reservation = Reservation.new(reservation_params)
    # binding.pry
    if @reservation.save
      flash[:notice] = "予約が完了しました"
    redirect_to :room_reservations
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
    params.require(:reservation).permit(:start_date, :end_date, :purson_num, :room_id, :reservation_user_id, :total)
  end
  
end
