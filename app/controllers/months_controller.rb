class MonthsController < ApplicationController
  def index
    @rooms = Room.includes(:months).order("number ASC")
    @room = Room.find(params[:room_id])
    @months = Month.includes(:contact_books)
  end
end
