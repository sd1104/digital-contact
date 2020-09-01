class ContactBooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_foreign_instance
  before_action :find_contact_book_id, only: [:show, :edit, :update, :destroy]
  
  def index
    @all_contact_books = ContactBook.includes(:room).omit_today.where(room_id: (params[:room_id])).order("date ASC")
    @today_contact_book = ContactBook.find_by(date: Date.today, room_id: current_user.room_id)
    @everymonth = ContactBook.everymonth(current_user.room_id)
  end

  def new
    @contact_book = ContactBook.new
  end

  def create
    @contact_book = @room.contact_books.new(contact_book_params)
    if @contact_book.save
      flash[:notice] = "保存されました。"
      redirect_to room_contact_books_path(@room)
    else
      flash.now[:alert] = 'この内容では保存できません。'
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @contact_book.update(contact_book_params)
      redirect_to room_contact_books_path(@room)
      flash.now[:notice] = '連絡帳の内容を更新しました。'
    else
      flash.now[:alert] = '保存できません。'
      render :edit
    end
  end

  def destroy
    @contact_book.destroy
    flash[:notice] = "無事削除されました。"
    redirect_to room_contact_books_path(@room)
  end

  private
  def set_foreign_instance
    @rooms = Room.includes(:contact_books).order("number ASC")
    @room = Room.find(params[:room_id])
    @notices = AbsentContact.includes(:room)
  end

  def find_contact_book_id
    @contact_book = ContactBook.find(params[:id])
  end

  def contact_book_params
    params.require(:contact_book).permit(
      :date,
      :letter,
      :bring,
      :schedule,
      :homework,
      :inform
    ).merge(room_id: params[:room_id])
  end

end

