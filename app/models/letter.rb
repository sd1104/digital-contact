class Letter < ApplicationRecord
  belongs_to :room

  validates :released_at, presence: true, uniqueness: true

  mount_uploader :pif, PdfUploader
end
