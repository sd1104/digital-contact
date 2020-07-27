class LettersController < ApplicationController
  before_action :set_params
  before_action :set_foreign_instance

  def index
  end

  def new
  end

  def create
  end

  private
  def set_params
    params.require(:letter).permit(:released_at, :name, :pdf)
  end
  
  def set_foreign_instance
    @rooms = Room.includes(:contact_books).order("number ASC")
    @room = Room.find(params[:room_id])
  end

end
