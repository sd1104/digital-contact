class LettersController < ApplicationController
  before_action :set_foreign_instance

  def index
    @letters = Letter.all.order("release_at ASC")
  end

  def new
  end

  def create
    letter = Letter(params[:room_id])
    letter.update(letter_params)
  end

  private
  def letter_params
    params.require(:letters).permit(:released_at, :name, :pdf)
  end
  
  def set_foreign_instance
    @rooms = Room.includes(:contact_books).order("number ASC")
    @room = Room.find(params[:room_id])
  end

end
