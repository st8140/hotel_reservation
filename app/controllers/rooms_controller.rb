class RoomsController < ApplicationController
  
  def index
  end
  
  def new
  end
  
  def create
  end
  
  def show
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
end