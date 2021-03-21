class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, {only: [:edit, :update, :destroy]}
  
  def index
    @room = Room.find_by(id: params[:id])
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      @room.room_id = @room.id
      @room.save
      flash[:notice] = "ルーム登録が完了しました"
      redirect_to("/rooms/#{@room.id}")
    else
      render("/rooms/new")
    end
  end
  
  def show
    @rooms = current_user.rooms
    @user = User.find_by(id: params[:id])
    @reservation= Reservation.new
    
  end
  
  def edit
    @room = Room.find_by(id: params[:id])
  end
  
  def update
    @room = Room.find_by(id: params[:id])
    if @room.update(room_params)
      flash[:notice] = "ルーム情報を更新しました"
      redirect_to "/rooms/#{@room.room_id}/reservations/new"
    else
      render edit_room_path(@room)
    end
  end
  
  def destroy
    @room = Room.find_by(id: params[:id])
    @room.destroy
    flash[:notice] = "ルームを削除しました"
    redirect_to("/rooms/posts")
  end
  
  def ensure_current_user
    @room = Room.find_by(id: params[:id])
    if @room.user_id != current_user.id
      flash[:alert] = "権限がありません"
      redirect_to "/"
    end
  end
  
  
  
  private
  
  
  def room_params
    params.require(:room).permit(:room_name, :room_introduction, :charge, :address, :room_image, :user_id, :room_id)
  end
  
end
