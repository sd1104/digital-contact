class AbsentContact < ApplicationRecord
  belongs_to :room
  belongs_to :user

  enum kind: { absent: 0, latein: 1, earlyout: 2 }

  enum after_contact: { necessary: true, unnecessary: false,  }
end
