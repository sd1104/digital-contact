class ContactBooksController < ApplicationController
  before_action :authenticate_user!
  before_action :set_foreign_instance
  
  def index
    @all_contact_books = ContactBook.includes(:room).omit_today.where(room_id: (params[:room_id])).order("date ASC")
    @today_contact_book = ContactBook.includes(:room).get_today.where(room_id: (params[:room_id])).order("date ASC")
    @april_contact_books = ContactBook.includes(:room).get_april.get_past.where(room_id: (params[:room_id])).order("date ASC")
    @may_contact_books = ContactBook.includes(:room).get_may.get_past.where(room_id: (params[:room_id])).order("date ASC")
    @june_contact_books = ContactBook.includes(:room).get_june.get_past.where(room_id: (params[:room_id])).order("date ASC")
    @july_contact_books = ContactBook.includes(:room).get_july.get_past.where(room_id: (params[:room_id])).order("date ASC")
    @august_contact_books = ContactBook.includes(:room).get_august.get_past.where(room_id: (params[:room_id])).order("date ASC")
    @september_contact_books = ContactBook.includes(:room).get_september.get_past.where(room_id: (params[:room_id])).order("date ASC")
    @october_contact_books = ContactBook.includes(:room).get_october.get_past.where(room_id: (params[:room_id])).order("date ASC")
    @november_contact_books = ContactBook.includes(:room).get_november.get_past.where(room_id: (params[:room_id])).order("date ASC")
    @december_contact_books = ContactBook.includes(:room).get_december.get_past.where(room_id: (params[:room_id])).order("date ASC")
    @january_contact_books = ContactBook.includes(:room).get_january.get_past.where(room_id: (params[:room_id])).order("date ASC")
    @februry_contact_books = ContactBook.includes(:room).get_februry.get_past.where(room_id: (params[:room_id])).order("date ASC")
    @march_contact_books = ContactBook.includes(:room).get_march.get_past.where(room_id: (params[:room_id])).order("date ASC")
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
    @contact_book = ContactBook.find(params[:id])
  end

  def edit
    @contact_book = ContactBook.find(params[:id])
  end

  def update
    @contact_book = ContactBook.find(params[:id])
    if @contact_book.update(contact_book_params)
      redirect_to room_contact_books_path(@room)
      flash.now[:notice] = '連絡帳の内容を更新しました。'
    else
      flash.now[:alert] = '保存できません。'
      render :edi¥
      
    end
  end

  def destroy
    contact_book = ContactBook.find(params[:id])
    contact_book.destroy
    flash[:notice] = "無事削除されました。"
    redirect_to room_contact_books_path(@room)
  end

  private
  def set_foreign_instance
    @rooms = Room.includes(:contact_books).order("number ASC")
    @room = Room.find(params[:room_id])
    @notices = AbsentContact.includes(:room)
  end

  def contact_book_params
    params.require(:contact_book).permit(:date, :letter, :bring, :schedule, :homework, :inform).merge(room_id: params[:room_id])
  end

end

