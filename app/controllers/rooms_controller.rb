class RoomsController < ApplicationController
  before_action :authenticate_user!, except: :new
  before_action :authenticate_school!, only: :new
  before_action :set_rooms

  def index
  end

  def new
  end

  def show
    @room = Room.find(params[:id])
  end

  private
  def set_rooms
    @rooms = Room.includes(:contact_books).order("number ASC")
  end
end
