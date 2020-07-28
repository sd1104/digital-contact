class AbsentContactsController < ApplicationController
  before_action :set_foreign_instance, only: :index
  
  def index
  end

  def set_foreign_instance
    @rooms = Room.includes(:contact_books).order("number ASC")
    @room = Room.find(params[:room_id])
  end
end
