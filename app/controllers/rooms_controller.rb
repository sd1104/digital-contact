class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_school!, only: :new
  before_action :set_rooms, only: [ :index, :show ]
  before_action :find_room_id, only: [ :show, :edit, :update, :destroy ]

  def index
    @user = User.find(current_user.id)
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

  def show
  end

  def edit
  end

  def update
    if @room.update(room_params)
      redirect_to control_rooms_path
    else
      render :edit
    end
  end

  def destroy
    if @room.destroy
      redirect_to confirm_rooms_path
    else
      render :confirm
    end
  end

  def control
  end

  def confirm
    @rooms = Room.includes(:school).where(school_id: current_school.id)
  end

  def room_show
    @rooms = Room.all
  end

  def room_edit
    @rooms = Room.new(rooms_params).where(school_id: current_school.id)
  end

  private
  def set_rooms
    @rooms = Room.includes(:contact_books).order("number ASC")
  end

  def find_room_id
    @room = Room.find(params[:id])
  end

  def rooms_params
    params.require(:rooms)
  end

  def room_params
    params.require(:room).permit(:number, :grade).merge(school_id: current_school.id)
  end
end
