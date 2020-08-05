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
end