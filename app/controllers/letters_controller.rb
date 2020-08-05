class LettersController < ApplicationController
  before_action :set_foreign_instance

  def index
    @letters = Letter.includes(:room).order("released_at ASC")
  end

  def new
    @letter = Letter.new
  end

  def create
    @letter = @room.letters.new(letter_params)
    if @letter.save
      flash[:notice] = "保存されました。"
      redirect_to room_letters_path(@room)
    else
      flash.now[:alert] = '未入力があります。'
      render :new
    end
  end

  def destroy
    @letter = Letter.find(params[:id])
    @letter.destroy
    flash[:notice] = "無事削除されました。"
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
