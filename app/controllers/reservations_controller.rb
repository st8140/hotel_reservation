class ReservationsController < ApplicationController
  
  def index
    @reservations = current_user.reservations
    @room = Room.find_by(room_id: params[:room_id])
  end
  
  def new
    @reservation = Reservation.new
    @room = Room.find_by(room_id: params[:room_id])
    @user = User.find_by(params[:id])
    # binding.pry
  end
  
  def confirm
    @reservation = Reservation.new(reservation_params)
    @room = Room.find_by(room_id: params[:room_id])
    @user = User.find_by(params[:id])
    @reservation.room_id = @room.id
    @reservation.user_id = current_user.id
    @reservation.reservation_name = @room.room_name
    @reservation.reservation_introduction = @room.room_introduction
    @reservation.reservation_image = @room.room_image
    @day = (@reservation.end_date - @reservation.start_date).to_i
    @charge =  @room.charge
    @total = (@charge * @day) * @reservation.purson_num
    @reservation.total = @total
    if @reservation.invalid?
       render :new
    end
    # binding.pry
  end
  
  def create
    @reservation = Reservation.new(reservation_params)
    @room = Room.find_by(room_id: params[:room_id])
    @reservation.room_id = @room.id
    @reservation.user_id = current_user.id
    @reservation.reservation_name = @room.room_name
    @reservation.reservation_introduction = @room.room_introduction
    @reservation.reservation_image = @room.room_image
    # binding.pry
    if @reservation.save!
      flash[:notice] = "予約が完了しました"
      redirect_to "/rooms/#{@reservation.room_id}/reservations"
    else
      flash[:alert] = "予約が完了できませんでした"
      render :confirm
    end
  end
  
  def show
    @reservation = Reservation.find_by(room_id: params[:room_id])
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  
  end
  
  
  private
  
  def reservation_params
    params.require(:reservation).permit(:start_date, :end_date, :purson_num, :reservation_user_id, :total, :reservation_name, :reservation_introduction, :reservation_image,)
  end
  
end
