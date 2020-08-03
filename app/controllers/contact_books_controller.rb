class ContactBooksController < ApplicationController
  before_action :set_foreign_instance
  
  def index
    @today_contact_book = ContactBook.includes(:room).where(date: Date.today).where(room_id: (params[:room_id]))
    @april_contact_books = ContactBook.includes(:room).get_april.omit_today.where(room_id: (params[:room_id]))
    @may_contact_books = ContactBook.includes(:room).get_may.omit_today.where(room_id: (params[:room_id]))
    @june_contact_books = ContactBook.includes(:room).get_june.omit_today.where(room_id: (params[:room_id]))
    @july_contact_books = ContactBook.includes(:room).get_july.omit_today.where(room_id: (params[:room_id]))
    @august_contact_books = ContactBook.includes(:room).get_august.omit_today.where(room_id: (params[:room_id]))
    @september_contact_books = ContactBook.includes(:room).get_september.omit_today.where(room_id: (params[:room_id]))
    @october_contact_books = ContactBook.includes(:room).get_october.omit_today.where(room_id: (params[:room_id]))
    @november_contact_books = ContactBook.includes(:room).get_november.omit_today.where(room_id: (params[:room_id]))
    @december_contact_books = ContactBook.includes(:room).get_december.omit_today.where(room_id: (params[:room_id]))
    @january_contact_books = ContactBook.includes(:room).get_january.omit_today.where(room_id: (params[:room_id]))
    @februry_contact_books = ContactBook.includes(:room).get_februry.omit_today.where(room_id: (params[:room_id]))
    @march_contact_books = ContactBook.includes(:room).get_march.omit_today.where(room_id: (params[:room_id]))
    @everymonth = {}
    @everymonth["３月の連絡帳"] = @march_contact_books
    @everymonth["２月の連絡帳"] = @februry_contact_books
    @everymonth["１月の連絡帳"] = @january_contact_books
    @everymonth["１２月の連絡帳"] = @december_contact_books
    @everymonth["１１月の連絡帳"] = @november_contact_books
    @everymonth["１０月の連絡帳"] = @october_contact_books
    @everymonth["９月の連絡帳"] = @september_contact_books
    @everymonth["８月の連絡帳"] = @august_contact_books
    @everymonth["７月の連絡帳"] = @july_contact_books
    @everymonth["６月の連絡帳"] = @june_contact_books
    @everymonth["５月の連絡帳"] = @may_contact_books
    @everymonth["４月の連絡帳"] = @april_contact_books
    @everymonth
  end

  def new
    @contact_book = ContactBook.new
  end

  def create
    ContactBook.create(contact_book_params)
    redirect_to room_contact_books_path(@room)
  end

  def show
    @contact_book = ContactBook.find(params[:id])
  end

  def edit
    @contact_book = ContactBook.find(params[:id])
  end

  def update
    @contact_book = ContactBook.find(params[:id])
    if @contact_book.update(contact_book_params)
      redirect_to room_contact_books_path(@room)
    else
      render :edit
    end
  end

  def destroy
    contact_book = ContactBook.find(params[:id])
    contact_book.destroy
    redirect_to room_contact_books_path(@room)
  end

  private
  def set_foreign_instance
    @rooms = Room.includes(:contact_books).order("number ASC")
    @room = Room.find(params[:room_id])
  end

  def contact_book_params
    params.require(:contact_book).permit(:date, :letter, :bring, :schedule, :homework, :inform).merge(room_id: params[:room_id])
  end

end

