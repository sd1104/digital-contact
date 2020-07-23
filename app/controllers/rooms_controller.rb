class RoomsController < ApplicationController
  def index
    @rooms = Room.all.order("number ASC")
  end
end
