class RoomsController < ApplicationController
  before_action :authenticate_user!, only: [:index, :show]
  before_action :authenticate_school!, only: :new
  before_action :set_rooms, only: [ :index, :show ]

  def index
  end

  def grade1
    @grade1 = RoomCollection.new
  end

  def grade1_post
    @grade1 = RoomCollection.new(rooms_params)
    unless @grade1.valid?
      flash[:alert] = @user.errors.full_messages
      render :grade1 and return
    end
    session["room_data"] = {room: @grade1 }
    @grade2 = RoomCollection.new
    render :grade2
  end

  def grade2_post
    @rooms = RoomCollection.new(session["room_data"]["room"])
    grade2 = RoomCollection.new(rooms_params)
    unless @grade2.valid?
      flash[:alert] = @grade2.errors.full_messages
      render :grade1 and return
    end
    session["room_data"] = {room: @grade2 }
    @grade3 = RoomCollection.new(rooms_params)
    render :grade3
  end

  def grade3_post
    @grade3 = RoomCollection.new(rooms_params)
    unless @grade3.valid?
      flash[:alert] = @grade3.errors.full_messages
      render :grade1 and return
    end
    session["room_data"] = {room: @grade3 }
    @grade4 = RoomCollection.new(rooms_params)
    render :grade4
  end

  def grade4_post
    @grade4 = RoomCollection.new(rooms_params)
    unless @grade4.valid?
      flash[:alert] = @grade4.errors.full_messages
      render :grade1 and return
    end
    session["room_data"] = {room: @grade4 }
    @grade5 = RoomCollection.new
    render :grade5
  end

  def grade5_post
    @grade5 = RoomCollection.new(rooms_params)
    unless @grade5.valid?
      flash[:alert] = @grade5.errors.full_messages
      render :grade1 and return
    end
    session["room_data"] = {room: @grade5 }
    @grade6 = RoomCollection.new
    render :grade6
  end

  def grade6_post
    @grade6 = RoomCollection.new(rooms_params)
    unless @grade6.valid?
      flash[:alert] = @grade6.errors.full_messages
      render :grade1 and return
    end
    session["room_data"] = {room: @grade6 }
    @grade7 = RoomCollection.new
    render :grade7
  end

  def grade7_post
    @grade7 = RoomCollection.new(rooms_params)
    unless @grade7.valid?
      flash[:alert] = @grade7.errors.full_messages
      render :grade1 and return
    end
    session["room_data"] = {room: @grade7 }

    render :end
  end


  def end
  end

  def show
    @room = Room.find(params[:id])
  end

  private
  def set_rooms
    @rooms = Room.includes(:contact_books).order("number ASC")
  end

  def rooms_params
    params.require(:rooms)
  end
end
