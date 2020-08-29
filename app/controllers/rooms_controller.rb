class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_school!, only: :new
  before_action :set_rooms, only: [ :index, :show ]

  def index
  end

  def control
  end

  def confirm
    @rooms = Room.includes(:school).where(school_id: current_school.id)
  end

  def new
    @rooms = RoomCollection.new
  end

  def create
    @rooms = RoomCollection.new(rooms_params)
    if @rooms.save
      redirect_to control_rooms_path
    else
      render :new1
    end
  end

  def room_show
    @rooms = Room.all
  end

  def room_edit
    @rooms = Room.new(rooms_params).where(school_id: current_school.id)
  end

  def show
    @room = Room.find(params[:id])
  end

  def edit
    @room = Room.find(params[:id])
  end

  def update
    @room = Room.find(params[:id])
    if @room.update(room_params)
      redirect_to control_rooms_path
    else
      render :edit
    end
  end

  def destroy
    @room = Room.find(params[:id])
    if @room.destroy
      redirect_to confirm_rooms_path
    else
      render :confirm
    end
  end


  private
  def set_rooms
    @rooms = Room.includes(:contact_books).order("number ASC")
  end

  def rooms_params
    params.require(:rooms)
  end

  def room_params
    params.require(:room).permit(:number, :grade).merge(school_id: current_school.id)
  end
end
