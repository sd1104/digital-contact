class RoomsController < ApplicationController
  def index
    @rooms = Room.includes(:months).order("number ASC")
  end
end
