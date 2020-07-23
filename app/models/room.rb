class Room < ApplicationRecord
  validates :number, presence: true, uniqueness: true 
end
