class LettersController < ApplicationController
  before_action :set_foreign_instance

  def index
    @letters = Letter.includes(:room).order("released_at ASC")
  end

  def new
    @letter = Letter.new
  end

  def create
    Letter.create(letter_params)
    redirect_to room_letters_path(@room)
  end

  def destroy
    @letter = Letter.find(params[:id])
    letter.destroy
    redirect_to room_letters_path(@room)
  end

  private
  def letter_params
    params.require(:letter).permit(:released_at, :name, :pdf).merge(room_id: params[:room_id])
  end
  
  def set_foreign_instance
    @rooms = Room.includes(:contact_books).order("number ASC")
    @room = Room.find(params[:room_id])
  end

end
