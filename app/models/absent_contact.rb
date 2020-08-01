class AbsentContact < ApplicationRecord
  belongs_to :room
  belongs_to :user

  enum kind: { absent: 0, latein: 1, earlyout: 2 }
  enum after_contact: { unnecessary: false, necessary: true }
  enum t_checked: { unconfirmed: false, confirmed: true }

  def set_date
    week = %w(日 月 火 水 木 金 土)[self.absent_at.wday]
    absent_at.strftime("%-m月%-d日(#{week})")
  end
end
