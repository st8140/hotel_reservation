class ReservationsController < ApplicationController
  
  def index
    @reservations = Reservation.all
  end
  
  def new
    @reservation = Reservation.new
    @room = Room.find(params[:id])
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find_by(params[:id])
    @reservation.reservation_user_id = current_user.id
    @reservation.room_id = @room.id
    @day = (@reservation.end_date - @reservation.start_date).to_i
    @charge =  @room.charge
    @total = (@charge * @day) * @reservation.purson_num
    @reservation.total = @total
    
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    @room = Room.find_by(params[:id])
    if @reservation.save
      flash[:notice] = "予約が完了しました"
      redirect_to room_reservation_path(@room)
    else
      flash[:alert] = "予約が完了できませんでした"
      render :confirm
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
    params.require(:reservation).permit(:reservation_name, :reservation_image, :reservation_introduction, :start_date, :end_date, :purson_num, :room_id, :reservation_user_id, :total)
  end
  
end
