class Room < ApplicationRecord
  has_many :room_months
  has_many :months, through: :room_months

  validates :number, presence: true, uniqueness: true 
end