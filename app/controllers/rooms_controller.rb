class RoomsController < ApplicationController
  
  def index
    @rooms = Room.all
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
  end
  
  def edit
  end
  
  def update
  end
  
  def destroy
  end
  
  def search
    @rooms = Room.search(params[:search])
  end
  
  
  
  private
  
  def room_params
    params.require(:room).permit(:room_name, :introduction, :charge, :address, :room_image)
  end
  
end
