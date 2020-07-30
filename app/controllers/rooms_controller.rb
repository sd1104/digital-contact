class RoomsController < ApplicationController
  before_action :set_rooms

  def index

  end

  def show
    @room = Room.find(params[:id])
  end

  private
  def set_rooms
    @rooms = Room.includes(:contact_books).order("number ASC")
  end
end
