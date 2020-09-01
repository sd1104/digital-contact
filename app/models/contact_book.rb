class ContactBook < ApplicationRecord
  belongs_to :room
  validates :date, presence: true

  def set_date
    week = %w(日 月 火 水 木 金 土)[self.date.wday]
    date.strftime("%-m月%-d日(#{week})")
  end
  
  scope :omit_today,  -> { where.not(date: Date.today) }
  scope :get_today, -> { where(date: Date.today) }
  scope :get_future, -> { where( 'date > ?', Date.today )}
  scope :get_past, -> { where( 'date < ?', Date.today )}

  scope :get_april, -> { where(date: (20200401 .. 20200431)) }
  scope :get_may, -> { where(date: (20200501 .. 20200531)) }
  scope :get_june, -> { where(date: (20200601 .. 20200631)) }
  scope :get_july, -> { where(date: (20200701 .. 20200731)) }
  scope :get_august, -> { where(date: (20200801 .. 20200831)) }
  scope :get_september, -> { where(date: (20200901 .. 20200931)) }
  scope :get_october, -> { where(date: (20201001 .. 20201031)) }
  scope :get_november, -> { where(date: (20201101 .. 20201101)) }
  scope :get_december, -> { where(date: (20201201 .. 20201231)) }
  scope :get_january, -> { where(date: (20200101 .. 20200131)) }
  scope :get_februry, -> { where(date: (20200201 .. 20200231)) }
  scope :get_march, -> { where(date: (20200301 .. 20200331)) }

  def self.everymonth(room_id)
    @april_contact_books = ContactBook.includes(:room).get_april.get_past.where(room_id: room_id).order("date ASC")
    @may_contact_books = ContactBook.includes(:room).get_may.get_past.where(room_id: room_id).order("date ASC")
    @june_contact_books = ContactBook.includes(:room).get_june.get_past.where(room_id: room_id).order("date ASC")
    @july_contact_books = ContactBook.includes(:room).get_july.get_past.where(room_id: room_id).order("date ASC")
    @august_contact_books = ContactBook.includes(:room).get_august.get_past.where(room_id: room_id).order("date ASC")
    @september_contact_books = ContactBook.includes(:room).get_september.get_past.where(room_id: room_id).order("date ASC")
    @october_contact_books = ContactBook.includes(:room).get_october.get_past.where(room_id: room_id).order("date ASC")
    @november_contact_books = ContactBook.includes(:room).get_november.get_past.where(room_id: room_id).order("date ASC")
    @december_contact_books = ContactBook.includes(:room).get_december.get_past.where(room_id: room_id).order("date ASC")
    @january_contact_books = ContactBook.includes(:room).get_january.get_past.where(room_id: room_id).order("date ASC")
    @februry_contact_books = ContactBook.includes(:room).get_februry.get_past.where(room_id: room_id).order("date ASC")
    @march_contact_books = ContactBook.includes(:room).get_march.get_past.where(room_id: room_id).order("date ASC")
    everymonth = {}
    everymonth["３月の連絡帳"] = @march_contact_books
    everymonth["２月の連絡帳"] = @februry_contact_books
    everymonth["１月の連絡帳"] = @january_contact_books
    everymonth["１２月の連絡帳"] = @december_contact_books
    everymonth["１１月の連絡帳"] = @november_contact_books
    everymonth["１０月の連絡帳"] = @october_contact_books
    everymonth["９月の連絡帳"] = @september_contact_books
    everymonth["８月の連絡帳"] = @august_contact_books
    everymonth["７月の連絡帳"] = @july_contact_books
    everymonth["６月の連絡帳"] = @june_contact_books
    everymonth["５月の連絡帳"] = @may_contact_books
    everymonth["４月の連絡帳"] = @april_contact_books
    return everymonth
  end


end