class ContactBooksController < ApplicationController
  before_action :set_foreign_instance
  
  def index
    @april_contact_books = ContactBook.where(date: (20200401 .. 20200431)).where(room_id: (params[:room_id])).includes(:room)
    @may_contact_books = ContactBook.where(date: (20200501 .. 20200531)).where(room_id: (params[:room_id])).includes(:room)
    @june_contact_books = ContactBook.where(date: (20200601 .. 20200631)).where(room_id: (params[:room_id])).includes(:room)
    @july_contact_books = ContactBook.where(date: (20200701 .. 20200731)).where(room_id: (params[:room_id])).includes(:room)
    @august_contact_books = ContactBook.where(date: (20200801 .. 20200831)).where(room_id: (params[:room_id])).includes(:room)
    @september_contact_books = ContactBook.where(date: (20200901 .. 20200931)).where(room_id: (params[:room_id])).includes(:room)
    @october_contact_books = ContactBook.where(date: (20201001 .. 20201031)).where(room_id: (params[:room_id])).includes(:room)
    @november_contact_books = ContactBook.where(date: (20201101 .. 20201101)).where(room_id: (params[:room_id])).includes(:room)
    @december_contact_books = ContactBook.where(date: (20201201 .. 20201231)).where(room_id: (params[:room_id])).includes(:room)
    @january_contact_books = ContactBook.where(date: (20200101 .. 20200131)).where(room_id: (params[:room_id])).includes(:room)
    @februry_contact_books = ContactBook.where(date: (20200201 .. 20200231)).where(room_id: (params[:room_id])).includes(:room)
    @march_contact_books = ContactBook.where(date: (20200301 .. 20200331)).where(room_id: (params[:room_id])).includes(:room)
    @everymonth = {}
    @everymonth["４月の連絡帳"] = @april_contact_books
    @everymonth["５月の連絡帳"] = @may_contact_books
    @everymonth["６月の連絡帳"] = @june_contact_books
    @everymonth["７月の連絡帳"] = @july_contact_books
    @everymonth["８月の連絡帳"] = @august_contact_books
    @everymonth["９月の連絡帳"] = @september_contact_books
    @everymonth["１０月の連絡帳"] = @october_contact_books
    @everymonth["１１月の連絡帳"] = @november_contact_books
    @everymonth["１２月の連絡帳"] = @december_contact_books
    @everymonth["１月の連絡帳"] = @january_contact_books
    @everymonth["２月の連絡帳"] = @februry_contact_books
    @everymonth["３月の連絡帳"] = @march_contact_books
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

  private
  def set_foreign_instance
    @rooms = Room.includes(:contact_books).order("number ASC")
    @room = Room.find(params[:room_id])
  end

  def contact_book_params
    params.require(:cotact_book).permit(:date, :letter, :bring, :schedule, :homework, :inform).merge(room_id: params[:room_id])
  end

end

