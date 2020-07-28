class AbsentContact < ApplicationRecord
  belongs_to :room


  with_options presence: true do
    validates :arised_at
    validates :absent_kind
    validates :reason
  end
end
