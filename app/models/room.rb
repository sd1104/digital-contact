class Room < ApplicationRecord
  belongs_to :school
  has_many :contact_books
  has_many :letters
  has_many :users
  has_many :absent_contacts
end



# class CreateAbsentContacts < ActiveRecord::Migration[6.0]
#   def change
#     create_table :absent_contacts do |t|
#       t.date :arised_at, null: false
#       t.integer :absent_kind, null: false
#       t.text :reason, null: false
#       t.references :room, null:false, foreign_key: true
#       t.timestamps
#     end
#   end
# end

# belongs_to :room


# with_options presence: true do
#   validates :arised_at
#   validates :absent_kind
#   validates :reason
# end