class RoomsController < ApplicationController
  def index
    @rooms = Room.includes(:contact_books).order("number ASC")
  end
end
