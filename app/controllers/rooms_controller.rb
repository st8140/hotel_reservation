class RoomsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_current_user, {only: [:edit, :update, :destroy]}
  
  def index
    @rooms = current_user.rooms
    @reservation= Reservation.new
  end
  
  def new
    @room = Room.new
  end
  
  def create
    @room = Room.new(room_params)
    if @room.save
      flash[:notice] = "ルーム登録が完了しました"
      redirect_to("/rooms/#{@room.id}")
    else
      render("/rooms/new")
    end
  end
  
  def show
    @room = Room.find_by(id: params[:id])
    @user = User.find_by(id: params[:id])
    @reservation = Reservation.new
    
  end
  
  def edit
  end
  
  def update
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
  
  def search
    
  end
  
  
  private
  
  
  def room_params
    params.require(:room).permit(:room_name, :room_introduction, :charge, :address, :room_image, :user_id)
  end
  
end
