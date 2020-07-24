class ContactBook < ApplicationRecord
  belongs_to :month

  validates :date, presence: true, uniqueness: true 
end
