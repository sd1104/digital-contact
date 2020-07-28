class Letter < ApplicationRecord
  belongs_to :room

  validates :released_at, presence: true, uniqueness: true

  mount_uploader :pdf, PdfUploader

  def set_date
    week = %w(日 月 火 水 木 金 土)[self.released_at.wday]
    released_at.strftime("%-m月%-d日(#{week})")
  end
end
