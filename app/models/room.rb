class Room < ApplicationRecord
  belongs_to :school
  has_many :contact_books
  has_many :letters
  has_many :users
  has_many :absent_contacts
end