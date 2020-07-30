class ContactBook < ApplicationRecord
  belongs_to :room
  validates :date, presence: true, uniqueness: true

  def set_date
    week = %w(日 月 火 水 木 金 土)[self.date.wday]
    date.strftime("%-m月%-d日(#{week})")
  end



  # def everymonth
  #   @april_contact_books = self.where(date: (20200401 .. 20200431)).where(room_id: (params[:room_id]))
  #   @may_contact_books = self.where(date: (20200501 .. 20200531)).where(room_id: (params[:room_id]))
  #   @june_contact_books = self.where(date: (20200601 .. 20200631)).where(room_id: (params[:room_id]))
  #   @july_contact_books = self.where(date: (20200701 .. 20200731)).where(room_id: (params[:room_id]))
  #   @august_contact_books = self.where(date: (20200801 .. 20200831)).where(room_id: (params[:room_id]))
  #   @september_contact_books = self.where(date: (20200901 .. 20200931)).where(room_id: (params[:room_id]))
  #   @october_contact_books = self.where(date: (20201001 .. 20201031)).where(room_id: (params[:room_id]))
  #   @november_contact_books = self.where(date: (20201101 .. 20201101)).where(room_id: (params[:room_id]))
  #   @december_contact_books = self.where(date: (20201201 .. 20201231)).where(room_id: (params[:room_id]))
  #   @january_contact_books = self.where(date: (20200101 .. 20200131)).where(room_id: (params[:room_id]))
  #   @februry_contact_books = self.where(date: (20200201 .. 20200231)).where(room_id: (params[:room_id]))
  #   @march_contact_books = self.where(date: (20200301 .. 20200331)).where(room_id: (params[:room_id]))
  #   @everymonth = {}
  #   @everymonth["４月の連絡帳"] = @april_contact_books
  #   @everymonth["５月の連絡帳"] = @may_contact_books
  #   @everymonth["６月の連絡帳"] = @june_contact_books
  #   @everymonth["７月の連絡帳"] = @july_contact_books
  #   @everymonth["８月の連絡帳"] = @august_contact_books
  #   @everymonth["９月の連絡帳"] = @september_contact_books
  #   @everymonth["１０月の連絡帳"] = @october_contact_books
  #   @everymonth["１１月の連絡帳"] = @november_contact_books
  #   @everymonth["１２月の連絡帳"] = @december_contact_books
  #   @everymonth["１月の連絡帳"] = @january_contact_books
  #   @everymonth["２月の連絡帳"] = @februry_contact_books
  #   @everymonth["３月の連絡帳"] = @march_contact_books
  #   return @everymonth
  # end

end
