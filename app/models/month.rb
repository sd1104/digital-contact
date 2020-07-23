class Month < ApplicationRecord
  has_many :contact_books
  
  has_many :rooms
  has_many :rooms, through: :room_months


end
