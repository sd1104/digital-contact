class Room < ApplicationRecord
  has_many :contact_books

  validates :number, presence: true, uniqueness: true 
end
