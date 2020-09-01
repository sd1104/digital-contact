class AbsentContact < ApplicationRecord
  belongs_to :room
  belongs_to :user

  validates :absent_at, presence: true
  validates :kind, presence: true
  validates :reason, presence: true
  validates :after_contact, presence: true
  validates :t_checked, presence: true

  enum kind: { absent: 0, latein: 1, earlyout: 2 }
  enum after_contact: { unnecessary: false, necessary: true }

  def set_date
    week = %w(日 月 火 水 木 金 土)[self.absent_at.wday]
    absent_at.strftime("%-m月%-d日(#{week})")
  end

  scope :omit_today,  -> { where.not(absent_at: Date.today) }
  scope :get_today, -> { where(absent_at: Date.today) }
  scope :get_future, -> { where( 'absent_at > ?', Date.today )}
  scope :get_past, -> { where( 'absent_at < ?', Date.today )}
end
